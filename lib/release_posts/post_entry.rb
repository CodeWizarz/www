# frozen_string_literal: true

require 'cgi'
require 'gitlab'
require 'open-uri'
require 'styled_yaml'

require_relative '../team'
require_relative '../api_retry'

WWW_GITLAB_COM_PROJECT_ID = 7764
ISSUEABLE_TYPES = %w[issues epics].freeze

module ReleasePosts
  class PostEntryCollection
    include ApiRetry
    include Helpers

    attr_reader :options

    def initialize(options)
      @options = options

      Gitlab.configure do |config|
        config.endpoint = 'https://gitlab.com/api/v4'

        unless options.dry_run
          # The Gitlab Bot account has correct permission in the www-gitlab-com pipeline
          config.private_token = ENV.fetch('GITLAB_BOT_TOKEN', nil) || ENV.fetch('PRIVATE_TOKEN', nil)
        end
      end
    end

    def execute
      issueable_urls = [options.issue_url].reject(&:empty?)
      issueables = []

      if issueable_urls.empty?
        ISSUEABLE_TYPES.product(TYPES).collect do |i_type, rp_type|
          issueable_urls.push("https://gitlab.com/api/v4/groups/9970/#{i_type}?state=opened&labels=#{rp_type.label}")
        end
      end

      issueable_urls.each do |u|
        api_retry do
          body = URI.open(u, 'Accept' => 'application/json').read
          issues = [JSON.parse(body)].flatten

          log_info("#{u} returned #{issues.length} items")
          issueables = [issueables, issues].flatten
        end
      end

      issueables.each do |i|
        unless api_issueable? i
          begin
            api_retry do
              i = api_issueable i
            end
          rescue StandardError => e
            log_error("failed to upgrade #{i['web_url']} to api response", e.message)
            next
          end
        end

        next unless i

        begin
          issue = Issue.new(i, options.type)
          ReleasePosts::PostEntry.new(issue, @options).execute
        rescue StandardError => e
          log_error("failed to process #{i['web_url']}", e.message)
          puts e.backtrace
          next
        end
      end
    end

    private

    # Dectect API issueables by checking how Web URL is formed. Web URLs for
    # the internal API are relative, but absolute for public API.
    def api_issueable?(issueable)
      issueable['web_url'].start_with? "http"
    end

    def api_issueable(issueable)
      issueable_iid = issueable['iid']
      parent_id = issueable['project_id'] || issueable['group_id']
      parent_type = issueable['project_id'] ? "projects" : "groups"
      issueable_type = issueable['project_id'] ? "issues" : "epics"

      u = "https://gitlab.com/api/v4/#{parent_type}/#{parent_id}/#{issueable_type}/#{issueable_iid}"
      body = URI.open(u, 'Accept' => 'application/json').read
      res = [JSON.parse(body)].flatten

      log_info("upgrading #{issueable['web_url']} to #{u}")
      return res.first unless res.length != 1

      fail_with "Unexpected response length. Too many items"
    end
  end

  class PostEntry
    include ApiRetry
    include Helpers

    attr_reader :options

    def initialize(issue, options)
      @options = options
      @issue = issue
    end

    def execute
      unless options.local == false
        assert_feature_branch!
        assert_new_file!
      end

      # Read type from $stdin unless it is already set
      @block_type = @issue.type_name || InputParser.read_type
      assert_valid_type!

      return write_api if options.local == false

      write_local
    end

    def image_url
      image_path&.delete_prefix('source')
    end

    def contents
      remove_trailing_whitespace(feature_content(block_type))
    end

    private

    def block_type
      @issue.type_name || @block_type
    end

    def create_commit
      commit_actions = [content_commit_action, image_commit_action].reject(&:nil?)
      commit_options = { start_branch: DEFAULT_BRANCH }

      log_info("creating #{file_path} on branch #{branch}", contents)
      log_info("creating #{image_path} on branch #{branch}") if image_commit_action

      return if options.dry_run

      begin
        api_retry do
          c = Gitlab.create_commit(project, branch, @issue.title, commit_actions, commit_options)
          log_success("commit created #{c.id} on branch '#{branch}'")
        end
      rescue Gitlab::Error::BadRequest => e
        raise unless e.message.include?("A branch called '#{branch}' already exists.")

        log_warning("commit failed, branch '#{branch}' already exists")
      end
    end

    def create_merge_request
      merge_request_iid = nil
      merge_request = {
        source_branch: branch,
        target_branch: DEFAULT_BRANCH,
        milestone_id: @issue.milestone_id,
        labels: [@issue.stage_label, @issue.group_label, release_post_label, 'release post', 'release post item', 'Technical Writing'],
        remove_source_branch: true
      }

      log_info("creating merge request #{merge_request}")

      merge_request['description'] = mr_description
      log_info('merge request description', merge_request['description']) if options.verbose

      # Assignement and milestones are very inconvenient without knowing global ids
      # It is simpler to make two API calls
      slash_assign = "/assign #{handles(pm_username)}" if pm_username
      slash_milestone = "/milestone %\"#{@issue.milestone_title}\"" if @issue.milestone_title
      note_body = [slash_assign, slash_milestone].join("\n")
      log_info('merge request slash command', note_body) if options.verbose

      return if options.dry_run

      begin
        api_retry do
          title = "Draft: #{@issue.title}"
          mr = Gitlab.create_merge_request(project, title, merge_request)
          merge_request_iid = mr.iid
          log_success("merge request created #{mr.web_url}")
        end
      rescue Gitlab::Error::Conflict => e
        raise unless e.message.include?("Another open merge request already exists for this source branch")

        log_warning("merge request already exists for the source branch '#{branch}'")
      end

      api_retry do
        Gitlab.create_merge_request_note(project, merge_request_iid, note_body) if merge_request_iid
      end
    end

    def edit_issuable(opts = {})
      log_info("relabelling #{@issue.issueable_type} #{@issue.web_url} with '#{RP_DRAFTED_LABEL}'")

      return if options.dry_run

      api_retry do
        if @issue.issue?
          Gitlab.edit_issue(@issue.project_id, @issue.iid, opts)
        else
          Gitlab.edit_epic(@issue.group_id, @issue.iid, opts)
        end
      end
    end

    def write_api
      create_commit
      create_merge_request
      edit_issuable(add_labels: [RP_DRAFTED_LABEL])
    end

    def content_commit_action
      { action: 'create',
        file_path: file_path,
        content: contents }
    end

    def image_commit_action
      return unless @issue.image_url

      begin
        return {
          action:    'create',
          file_path: image_path,
          content:   @issue.image_base64,
          encoding:  'base64'
        }
      rescue StandardError => e
        log_error("failed to fetch image #{@issue.image_url}", e.message)
      end
    end

    def mr_description
      template = File.open('.gitlab/merge_request_templates/Release-Post-Item.md').read

      # Remove slash commands because they aren't evaluated when set via the merge request API
      template = template.lines.reject { |line| line.start_with?('/label ', '/milestone ', '/assign ') }.join

      template = template.sub('`@engineers`', handles(assignee_usernames)) unless assignee_usernames.empty?
      template = template.sub('`@PM`', handles(pm_username)) if pm_username
      template = template.sub('`@PMM`', handles(pmm_username)) if pmm_username
      template = template.sub('`@TW`', handles(tw_username)) if tw_username
      template = template.sub('`@EM`', handles(em_username)) if em_username

      template = template.sub('- Feature Issue (required):', "- Feature Issue (required): #{@issue.web_url}")

      template
    end

    def feature_content(type_name)
      block = {
        'name' => StyledYAML.double_quoted(@issue.title),
        'available_in' => StyledYAML.inline(@issue.available_in),
        'gitlab_com' => true,
        'documentation_link' => StyledYAML.single_quoted(@issue.documentation_url),
        'image_url' => StyledYAML.single_quoted(image_url),
        'reporter' => reporter_username,
        'stage' => @issue.stage.key,
        'categories' => @issue.categories.map(&:name),
        'issue_url' => StyledYAML.single_quoted(@issue.issue_web_url),
        'epic_url' => StyledYAML.single_quoted(@issue.epic_web_url),
        'description' => StyledYAML.literal(@issue.content)
      }.compact!

      StyledYAML.dump('features' => { type_name => [block] })
    end

    def write_local
      abs_image_path = File.join(git_repo_path, image_path)
      abs_content_path = File.join(git_repo_path, file_path)

      log_info("creating #{abs_content_path} on branch #{branch}", contents)
      log_info("creating #{abs_image_path} on branch #{branch}") if @issue.image_url
      log_info("remember to stage and commit, before you push!")

      return if options.dry_run

      File.write(abs_content_path, contents)
      File.write(abs_image_path, @issue.image_binary) if @issue.image_url

      system("#{editor} '#{file_path}'") if editor
    end

    def editor
      ENV['EDITOR']
    end

    def assert_feature_branch!
      return unless git_current_branch == DEFAULT_BRANCH

      fail_with "Create a branch first!"
    end

    def assert_new_file!
      return unless File.exist?(file_path)
      return if options.force

      fail_with "#{file_path} already exists! Use `--force` to overwrite."
    end

    def assert_valid_type!
      return unless block_type && block_type == InputParser::INVALID_TYPE

      fail_with 'Invalid category given!'
    end

    def file_path
      filename = "#{@issue.stage.key}-#{@issue.slug}"

      # Replace underscores with dashes ('_' --> '-')
      filename.tr!('_', '-')

      # Set the extension and create base_path including filename and extension up to MAX_FILENAME_LENGTH
      ext = '.yml'
      base_path = File.join(unreleased_path, filename)
      +base_path[0..MAX_FILENAME_LENGTH - ext.length] + ext
    end

    def image_path
      # Per https://gitlab.com/gitlab-com/www-gitlab-com/-/issues/12681 we should default the image_url field for primary release items
      return "/images/unreleased/REPLACE_THIS_WITH_THE_IMAGE_PATH.png" if block_type == 'primary' && @issue.image_url.nil?

      return unless @issue.image_url

      ext = File.extname(@issue.image_url)
      base_path = File.join(unreleased_images_path, @issue.slug)
      +base_path[0..MAX_FILENAME_LENGTH - ext.length] + ext
    end

    def unreleased_path
      File.join('data', 'release_posts', 'unreleased')
    end

    def unreleased_images_path
      File.join('source', 'images', 'unreleased')
    end

    def branch
      options.branch || "#{reporter_username}/#{@issue.group.key}_#{@issue.iid}"
    end

    def project
      options.target_project_id || WWW_GITLAB_COM_PROJECT_ID
    end

    def release_post_label
      @issue.release_post_label || "release post item::#{options.type}"
    end

    def handles(usernames)
      [usernames].flatten.map { |u| "@#{u}" }.join(' ')
    end

    def username(name)
      return unless name

      # Handle malformed stages.yml providing array of stable counterparts
      name = name.first if name.is_a?(Array)

      clean_name = name.delete_suffix('(Interim)').strip
      Gitlab::Homepage::Team::Member.all!.find { |person| person.name == clean_name }&.gitlab
    end

    def pm_username
      username(@issue.group&.pm)
    end

    def pmm_username
      username(@issue.group&.pmm)
    end

    def tw_username
      username(@issue.group&.tech_writer)
    end

    def em_username
      bem = username(@issue.group&.backend_engineering_manager)
      fem = username(@issue.group&.frontend_engineering_manager)

      return bem if bem && !fem
      return fem if fem && !bem
      return bem if bem && fem
    end

    def assignee_usernames
      return [] unless @issue.assignees

      @issue.assignees.reject { |assignee| [pm_username, pmm_username, tw_username, em_username].include? assignee }
    end

    def reporter_username
      ENV['GITLAB_USERNAME'] || pm_username || "gitlab_bot"
    end

    def remove_trailing_whitespace(yaml_content)
      yaml_content.gsub(/ +$/, '')
    end
  end
end
