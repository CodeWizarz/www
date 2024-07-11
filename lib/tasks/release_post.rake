require_relative '../release_posts/kickoff'
require 'faraday_middleware'

namespace :release_post do
  PROJECT_ID = 7764
  BUYER_EXPERIENCE_PROJECT_ID = 28847821

  desc 'Creates the monthly release post'
  task :start do |t, args|
    # GITLAB_BOT has sufficient privileges in www-gitlab-com
    private_token = ENV.fetch('GITLAB_BOT_TOKEN', nil) || ENV.fetch('PRIVATE_TOKEN', nil)
    `git config --global user.email "job+bot@gitlab.com"`
    `git config --global user.name "Bot"`

    # Load release post managers data from yaml
    release_post_managers = YAML.load_file(File.expand_path('../../data/release_post_managers.yml', __dir__))

    # Determine the active XX.Y version and set participants
    release_post_managers["releases"].each_cons(2) do |r|
      date = Date.parse(r[0]["date"])
      unpublished = (date - Date.today).to_i >= 0
      next unless unpublished && (r[1] && (Date.parse(r[1]["date"]) - Date.today).to_i.negative?)

      @current_post ||= ReleasePosts::Kickoff.new(r[0])
      next_index = release_post_managers["releases"].index { |release| release["version"] == @current_post.version } - 1
      @next_post ||= ReleasePosts::Kickoff.new(release_post_managers["releases"][next_index])
    end

    # Participants
    release_post_manager = @current_post.release_post_manager
    release_post_manager_name = @current_post.release_post_manager_name
    rpm_shadow = @current_post.rpm_shadow
    tw_lead = @current_post.tw_lead
    tech_advisor = @current_post.tech_advisor
    pmm_lead = @current_post.pmm_lead

    # Various versions formats
    version = @current_post.version
    version_dash = version.tr('.', '-')
    version_underscore = version.tr('.', '_')
    branch_name = "release-#{version_dash}"
    next_version = @next_post.version

    # Parse date
    date = @current_post.date
    parsed_date = Date.parse(date)
    year = parsed_date.strftime("%Y")
    month = parsed_date.strftime("%m")
    day = parsed_date.strftime("%d")

    # Directories
    marketing_site_source_dir = File.expand_path('../../sites/uncategorized/source', __dir__)
    top_level_source_dir = File.expand_path('../../source', __dir__)
    source_releases_dir = "#{marketing_site_source_dir}/releases"
    data_releases_dir = File.expand_path('../../data/release_posts', __dir__)
    version_data_dir = "#{data_releases_dir}/#{version_underscore}"
    unreleased_data_dir = "#{data_releases_dir}/unreleased"
    images_dir = "#{top_level_source_dir}/images/#{version_underscore}"

    # Templates
    mvp_template = "#{unreleased_data_dir}/samples/mvp.yml"

    # Abort if the release branch has already been created
    abort("Aborted! The branch #{branch_name} already exists") if `git branch | grep #{branch_name}`.tr("\n", '').strip == branch_name

    # Stash modified and untracked files so we have a "clean" environment
    # without accidentally deleting data
    puts "Stashing changes"
    status = `git status --porcelain`
    `git stash -u` unless status.empty?

    # Sync with upstream master
    `git checkout master`
    `git pull https://jobbot:#{ENV.fetch('GITLAB_BOT_TOKEN')}@gitlab.com/gitlab-com/www-gitlab-com.git master`

    # Create branch
    `git checkout -b #{branch_name}`

    #
    # Release post intro
    #
    intro_filename = "#{source_releases_dir}/posts/#{date}-gitlab-#{version_dash}-released.html.md"

    if File.exist?(intro_filename)
      abort('rake aborted!') if ask("#{intro_filename} already exists. Do you want to overwrite?", %w[y n]) == 'n'
    end

    puts
    puts "--------------------------------"
    puts "=> Creating new release post intro: #{intro_filename}"

    intro_text = File.read('doc/templates/blog/monthly_release_blog_template.html.md')
    intro_text.gsub!('X.Y', version)
    intro_text.gsub!('X-Y', version_underscore)
    intro_text.gsub!('_NEXT_MILESTONE_', next_version)
    intro_text.gsub!('release_post_manager', release_post_manager)
    intro_text.gsub!('release_post_manager_name', release_post_manager_name)

    File.open(intro_filename, 'w') do |post|
      post.puts intro_text
    end

    #
    # Data directory
    #
    abort("Aborted! #{version_data_dir} already exists") if Dir.exist?(version_data_dir)
    puts "=> Creating new release post data directory: #{version_data_dir}"
    FileUtils.mkdir_p(version_data_dir)

    #
    # Images directory
    #
    abort("Aborted! #{images_dir} already exists") if Dir.exist?(images_dir)
    puts "=> Creating new release post images directory: #{images_dir}"
    FileUtils.mkdir_p(images_dir)
    FileUtils.touch "#{images_dir}/.gitkeep"

    #
    # MVP file
    #
    puts "=> Creating #{version_data_dir}/mvp.yml"
    FileUtils.cp(mvp_template, "#{version_data_dir}/mvp.yml")

    # Add, commit, and push
    `git add #{data_releases_dir} #{top_level_source_dir} #{marketing_site_source_dir} #{images_dir}`
    `git commit -m 'Init release post for #{version}'`
    `git push https://jobbot:#{ENV.fetch('GITLAB_BOT_TOKEN')}@gitlab.com/gitlab-com/www-gitlab-com.git #{branch_name}`

    #
    # Establish connection to GitLab
    #
    puts "Connecting to GitLab..."
    @gitlab = Gitlab.client(
      endpoint: 'https://gitlab.com/api/v4',
      private_token: private_token
    )
    @user = @gitlab.user
    puts "Connection successful. Connected user email: " << @user.email

    # Update placeholders in Release Post MR template
    template = File.open('.gitlab/merge_request_templates/Release-Post.md').read
    template.gsub!('X-Y', version_dash)
    template.gsub!('X_Y', version_underscore)
    template.gsub!('_MILESTONE_', version)
    template.gsub!('YYYY', year)
    template.gsub!('/MM', '/' + month)
    template.gsub!('-MM', '-' + month)
    template.gsub!('/DD', '/' + day)
    template.gsub!('-DD', '-' + day)
    template.gsub!('@release_post_manager', release_post_manager)
    template.gsub!('@rpm_shadow', rpm_shadow)
    template.gsub!('@tw_lead', tw_lead)
    template.gsub!('@tech_advisor', tech_advisor)
    template.gsub!('@pmm_lead', pmm_lead)

    #
    # Create Release Post MR
    #
    release_post_mr = @gitlab.create_merge_request(
      PROJECT_ID, "Draft: Release post - GitLab #{version}",
      {
        source_branch: branch_name,
        target_branch: 'master',
        description: template,
        should_remove_source_branch: true,
        squash: true
      })

    #
    # Create MVP Nominations Issue
    #

    mvp_issue_template = File.open('.gitlab/issue_templates/release-post-mvp-nominations.md').read
    mvp_issue_template.gsub!('_MILESTONE_', version)
    mvp_issue_template.gsub!('RP_MR_LINK', release_post_mr.web_url)
    mvp_issue_template.gsub!('@release_post_manager', release_post_manager)
    mvp_issue = @gitlab.create_issue(PROJECT_ID, "Release Post #{version} MVP Nominations", { description: mvp_issue_template, assignee_id: @user.id })

    #
    # Create Retrospective Issue
    #

    retro_issue_template = File.open('.gitlab/issue_templates/Release-Post-Retrospective.md').read
    retro_issue_template.gsub!('RP_MR_LINK', release_post_mr.web_url)
    retro_issue_template.gsub!('_MILESTONE_', version)
    retro_issue_template.gsub!('X-Y', version_dash)
    retro_issue_template.gsub!('@release_post_manager', release_post_manager)
    retro_issue_template.gsub!('@rpm_shadow', rpm_shadow)
    retro_issue_template.gsub!('@tw_lead', tw_lead)
    retro_issue_template.gsub!('@tech_advisor', tech_advisor)
    retro_issue_template.gsub!('@pmm_lead', pmm_lead)
    retro_issue = @gitlab.create_issue(PROJECT_ID, "Release Post #{version} Retrospective", { description: retro_issue_template, assignee_id: @user.id })

    #
    # Create MR in buyer-experience project
    #

    buyer_experience_connection = Faraday.new(
      url: "https://gitlab.com/api/v4/",
      headers: {
        'PRIVATE-TOKEN' => private_token,
        'User-Agent' => 'www-gitlab-com'
      }
    )

    buyer_experience_connection.post("projects/#{BUYER_EXPERIENCE_PROJECT_ID}/repository/branches?branch=#{version_dash}-release-post-changes&ref=main")

    buyer_experience_mr = @gitlab.create_merge_request(
      BUYER_EXPERIENCE_PROJECT_ID, "Draft: GitLab #{version} release post changes",
      {
        source_branch: "#{version_dash}-release-post-changes",
        target_branch: 'main',
        remove_source_branch: true
      })

    #
    # Update links in Release Post MR
    #

    release_post_mr = @gitlab.merge_request(PROJECT_ID, release_post_mr.iid)
    description = release_post_mr.description
    description.gsub!('RP_MR_LINK', release_post_mr.web_url)
    description.gsub!('MVP_ISSUE_LINK', mvp_issue.web_url)
    description.gsub!('RETRO_ISSUE_LINK', retro_issue.web_url)
    description.gsub!('BUYER_EXPERIENCE_LINK', buyer_experience_mr.web_url)
    @gitlab.update_merge_request(PROJECT_ID, release_post_mr.iid, { description: description })
  end
end
