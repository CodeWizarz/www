require_relative '../lib/gitlab/file_cache'
require_relative '../lib/api_retry'
require 'active_support/core_ext/date/calculations'
require 'active_support/core_ext/numeric/time'
require 'active_support/notifications'

require 'faraday_middleware'
require 'faraday_middleware/parse_oj'
require 'colorize'

module Generators
  class Direction
    class MilestoneFilter
      attr_accessor :filtering_date, :milestones_by_expired_state

      def initialize(milestones)
        self.filtering_date = Date.today
        self.milestones_by_expired_state =
          milestones
            .map(&method(:parse_due_date))
            .group_by(&method(:expired_state))
            .transform_values(&method(:sort_by_due_date))
      end

      def [](state)
        milestones_by_expired_state[state]
      end

      private

      def parse_due_date(milestone)
        due_date = milestone['due_date']
        due_date_object = Date.parse(due_date) if due_date

        milestone.merge('due_date_object' => due_date_object)
      end

      def expired_state(milestone)
        if due_date = milestone['due_date_object']
          if filtering_date <= due_date
            'active'
          else
            'closed'
          end
        else
          'undefined'
        end
      end

      def sort_by_due_date(milestones)
        milestones.sort_by { |ms| ms['due_date_object'] }
      end
    end

    module GitlabParamsEncoder
      extend self

      def encode(hash)
        # The GitLab API does _not_ handle encoded `+` properly in label names
        Faraday::NestedParamsEncoder.encode(hash).gsub('%2B', '+')
      end

      def decode(string)
        Faraday::NestedParamsEncoder.decode(string)
      end
    end

    class GitLabInstance
      include ::Gitlab::FileCache
      include ApiRetry

      set_cache_store 'direction'

      attr_reader :name

      HTTP_OK = 200

      def initialize(name)
        @connection = Faraday.new(
          url: endpoint,
          headers: headers,
          request: { params_encoder: GitlabParamsEncoder, timeout: 90 }
        ) do |config|
          config.request :json
          config.response :logger, nil, { headers: false, bodies: false }
          config.response :raise_error
          config.response :oj
          config.adapter Faraday.default_adapter
        end

        @name = name

        cache_store.clear if ENV.key?('CLEAR_DIRECTION_CACHE')
      end

      def get_single(path, params = {})
        cache_key = @connection.build_url(path, params).to_s

        cached(cache_key) do
          api_retry do
            @connection.get(path, params)
          end
        end
      end

      def get(path, additional_pages, params = {})
        content = []
        page = 1

        loop do
          params['page'] = page
          response = get_single(path, params)
          if Hash === response.body
            warn "Hash returned by #{response.env.url}"
            return response.body
          else
            content += response.body
          end
          page += 1
          break if page > response.headers['X-Total-Pages'].to_i || !additional_pages
        end
        content
      end

      private

      def endpoint
        'https://gitlab.com/api/v4'
      end

      def headers
        {
          'PRIVATE-TOKEN' => ENV['PRIVATE_TOKEN'],
          'User-Agent' => 'www-gitlab-com'
        }
      end
    end

    class GitLabProject
      def initialize(id, instance)
        @id = id.gsub('/', '%2F')
        @instance = instance
        @name = instance.name
      end

      def milestones(state = 'active')
        result = @instance.get("projects/#{@id}/milestones", true, state: state, per_page: 100)

        MilestoneFilter.new(result)[state]
      end

      def milestone(milestone_id)
        @instance.get("projects/#{@id}/milestones/#{milestone_id}", true, per_page: 100)
      end

      def milestone_direction_issues(milestone_id, labels)
        result = []
        labels.each do |label|
          result += @instance.get("projects/#{@id}/issues", true, milestone: milestone_id, labels: 'direction,' + label, confidential: 'false', per_page: 100)
        end
        result
      end

      def wishlist_issues(label, not_label = nil)
        result = @instance.get("projects/#{@id}/issues", true, milestone: 'No+Milestone', labels: "direction,#{label}", state: 'opened', confidential: 'false', per_page: 100, sort: 'asc')
        result += @instance.get("projects/#{@id}/issues", true, milestone: 'Backlog', labels: "direction,#{label}", state: 'opened', confidential: 'false', per_page: 100, sort: 'asc')
        result = result.select { |issue| (issue['labels'] & not_label).empty? } if not_label
        result
      end

      def tier_issues(tier)
        @instance.get("projects/#{@id}/issues", true, labels: "direction,#{tier}", state: 'opened', confidential: 'false', per_page: 100, sort: 'asc')
        # result = result.select { |issue| issue["milestone"] && issue["milestone"]["due_date"] }
      end

      def name
        project['name']
      end

      def web_url
        project['web_url']
      end

      def project
        @project ||= @instance.get("projects/#{@id}", true, per_page: 100)
      end
    end

    class GitLabGroup
      def initialize(id, instance)
        @id = id
        @instance = instance
        @name = instance.name
      end

      def milestones(state = 'active')
        result = @instance.get("groups/#{@id}/milestones", true, state: state, per_page: 100)

        MilestoneFilter.new(result)[state]
      end

      def merge_request_count(stage, milestone, labels = nil, state = 'merged')
        label_set = labels ? "devops::#{stage}, #{labels}" : "devops::#{stage}"
        result = @instance.get("groups/#{@id}/merge_requests", true, milestone: milestone, labels: label_set, state: 'merged', per_page: 100, sort: 'asc')
        result
      end

      def group
        @group ||= @instance.get("groups/#{@id}", true, per_page: 100)
      end

      # finds all Direction epics that have a fixed or inherited due date that falls
      # between the given milestone start and end dates, excluding those certain workflow labels
      def milestone_direction_epics(milestone, labels)
        results = []
        labels.each do |label|
          epics = @instance.get("groups/#{@id}/epics", true, labels: 'direction,' + label, confidential: 'false', per_page: 100)
          temp = []
          epics.each do |epic|
            # Skip this epic if there is no inherited due date or due date
            next if epic['due_date_from_inherited_source'].nil? && epic['due_date'].nil?

            # Skip if the epic is still in the validation phase, or in planning breakdown or refinement
            next if epic['labels'].any? { |label| ["workflow::start", "workflow::validation backlog", "workflow::problem validation", "workflow::solution validation", "workflow::ready for design", "workflow::design", "workflow::planning breakdown", "workflow::refinement"].include? label }

            # Include if the epic is due in the milestone and still open or closed in the milestone
            if !epic['due_date_from_inherited_source'].nil? &&
                (epic['due_date_from_inherited_source'] > milestone['start_date']) &&
                (epic['due_date_from_inherited_source'] <= milestone['due_date']) &&
                (epic['closed_at'].nil? || (epic['closed_at'] > milestone['start_date']))
              temp.push(epic)
              next
            end

            # Skip if there is no due date
            next if epic['due_date'].nil?

            # Include if the due date is within the milestone
            if (epic['due_date'] > milestone['start_date']) && (epic['due_date'] <= milestone['due_date'])
              temp.push(epic)
            end
          end
          results += temp
        end
        results
      end
    end

    STAGES = %w[manage plan create verify package deploy monitor secure govern ai-powered enablement modelops analytics].freeze
    DEV_STAGES = %w[manage plan create].freeze
    SEC_STAGES = %w[secure govern].freeze
    SECURE_STAGES = %w[secure].freeze
    OPS_STAGES = %w[verify package deploy monitor].freeze
    GOVERN_STAGES = %w[govern].freeze
    ENABLEMENT_STAGES = %w[enablement].freeze
    DATA_SCIENCE_STAGES = %w[ai-powered modelops].freeze
    ANALYTICS_STAGES = %w[analytics].freeze

    # set your stage to 'true' to include Epics with Direction label
    INCLUDE_EPICS = Hash.new("false")
    INCLUDE_EPICS['secure'] = true
    INCLUDE_EPICS['govern'] = true
    INCLUDE_EPICS['enablement'] = true
    INCLUDE_EPICS['modelops'] = true
    INCLUDE_EPICS['analytics'] = true
    INCLUDE_EPICS['ai-powered'] = true
    INCLUDE_EPICS.freeze

    def single_engineer_group_data
      {
        reach: {
          Vast: [10, "#064E3B"],
          Large: [6, "#065F46"],
          Significant: [3, "#047857"],
          Small: [1.5, "#059669"],
          Minimal: [0.5, "#10B981"]
        },
        impact: {
          Massive: [3, "#064E3B"],
          High: [2, "#065F46"],
          Medium: [1, "#047857"],
          Low: [0.5, "#059669"],
          Minimal: [0.25, "#10B981"]
        },
        confidence: {
          High: [1, "#064E3B"],
          Medium: [0.8, "#047857"],
          Low: [0.5, "#10B981"]
        },
        effort: {
          High: [3, "#10B981"],
          Medium: [2, "#047857"],
          Low: [1, "#064E3B"]
        }
      }
    end

    def get_direction_issues(project, milestone, stages)
      # some projects only contain issues from one stage
      issues = []
      case project.name
      when "gitlab-pages" # devops::deploy
        issues += project.milestone_direction_issues(milestone['title'], ["devops::deploy"]) if stages.include? "deploy"
      when "gitlab-runner" # devops::verify
        issues += project.milestone_direction_issues(milestone['title'], ["devops::verify"]) if stages.include? "verify"
      when "omnibus-gitlab" # devops::enablement
        issues += project.milestone_direction_issues(milestone['title'], ["devops::enablement"]) if stages.include? "enablement"
      else
        # for other projects, check all labels
        issues += project.milestone_direction_issues(milestone['title'], stages.map { |n| "devops::" + n })
      end
      issues
    end

    def format_direction_header(title, due_date)
      # check if the release number can cast to float (i.e., 11.1, 11.12, etc.)
      # this will be used to not display a date for non-matching, but included
      # milestones such as "Next 3-4 releases"
      begin
        if Float(title)
          # was able to cast to float, looks like a normal release number
          # milestone due date is actually code freeze, so we need to add 5 days so we display the correct date
          display_date = Date.parse(due_date) + 5.days
          output = "### #{title} (" + display_date.strftime('%Y-%m-%d') + ")\n\n"
        end
      rescue ArgumentError
        # milestone title is not a normal release number, do not include extra date info
        output = "### #{title}\n\n"
      end
      output
    end

    def get_issues(edition, milestone, stages)
      issues = []
      edition.each do |project|
        issues += get_direction_issues(project, milestone, stages)
      end
      issues
    end

    def get_direction_buckets(issues, epics, stages)
      buckets = {}
      issues.each do |issue|
        stages.each do |stage|
          buckets[stage] = {} if buckets[stage].nil?
          buckets[stage]['issues'] = [] if buckets[stage]['issues'].nil?
          buckets[stage]['issues'] << issue if issue['labels'].include?("devops::#{stage}")
        end
      end
      epics.each do |epic|
        stages.each do |stage|
          buckets[stage] = {} if buckets[stage].nil?
          buckets[stage]['epics'] = [] if buckets[stage]['epics'].nil?
          if epic['labels'].include?("devops::#{stage}")
            buckets[stage]['epics'] << epic
          end
        end
      end
      buckets
    end

    def fill_epics(milestone, buckets, stage)
      direction_epics = ''
      buckets[stage]['epics'].each do |epic|
        direction_epics += epic_bullet(epic)
      end
      direction_epics
    end

    def fill_issues(milestone, buckets, stage)
      direction_issues = ''
      buckets[stage]['issues'].each do |issue|
        direction_issues += issue_bullet(issue)
      end
      direction_issues
    end

    # rubocop:disable Metrics/AbcSize
    # turned off this rule until proper refactor can happen
    def generate_direction(stages, include_epics)
      # stages contains list like: stages = %w[manage plan create verify package deploy monitor secure]

      direction_output = Hash.new { |hash, key| hash[key] = Hash.new(&hash.default_proc) }
      direction_output["all"]["all"] = ''

      gitlaborg.milestones.each do |ms|
        # subtract 5 days because the release's milestone due date is set to the freeze, not release date
        next unless ms['due_date'] && Date.parse(ms['due_date']) >= Date.today - 5.days

        issues = get_issues(edition, ms, stages)
        epics = gitlaborg.milestone_direction_epics(ms, include_epics.keys.map { |n| "devops::" + n })

        next if issues.empty? && epics.empty?

        direction_output["all"]["all"] << format_direction_header(ms['title'], ms['due_date'])

        # run through all issues and epics and throw in relevant bucket (stage)
        buckets = get_direction_buckets(issues, epics, stages)

        # Now unfold the bins in order, so all the epics and issues are under their stage
        # Epics will come before issues for stages set to true in INCLUDE_EPICS hash
        stages.each do |stage|
          next unless buckets[stage].count.positive?

          direction_output[ms['title']][stage] = ''

          # If there is only one potential stage to include, the stage name is not necessary to enumerate.
          direction_output["all"]["all"] << "#### #{stage.capitalize}\n" if stages.length > 1

          direction_output[ms['title']][stage] += fill_epics(ms, buckets, stage) unless buckets[stage]['epics'].nil? || (include_epics[stage] == false)
          direction_output[ms['title']][stage] += fill_issues(ms, buckets, stage) unless buckets[stage]['issues'].nil?

          direction_output[ms['title']][stage] << "\n"
          direction_output["all"]["all"] << direction_output[ms['title']][stage] + "\n"
        end
      end
      direction_output
    end
    # rubocop: enable Metrics/AbcSize

    def generate_wishlist
      puts 'Generating wishlist...'
      output = {}

      # 'boards',
      # 'burndown charts',
      # 'capacity planning',
      # 'chat commands',
      # 'code review',
      # 'container registry',
      # 'deliver',
      # 'epics',
      # 'issue boards',
      # 'issues',
      # 'jira',
      # 'labels',
      # 'milestones',
      # 'major wins',
      # 'moderation',
      # 'notifications',
      # 'open source',
      # 'performance',
      # 'roadmaps',
      # 'search',
      # 'Monitoring',
      # 'search',
      # 'service desk',
      # 'todos',
      # 'usability',
      # 'vcs for everything',
      # 'wiki',

      [
        'devops::manage',
        'devops::plan',
        'devops::create',
        'devops::verify',
        'devops::package',
        'devops::deploy',
        'devops::monitor',
        'devops::secure',
        'devops::ai-powered',
        'devops::modelops',
        'HA',
        'Cloud Native',
        'moonshots',
        'SingleEngineerGroups'
      ].each do |label|
        output[label] = label_list(label)
      end
      ['GitLab Premium', 'GitLab Ultimate'].each do |tier|
        output[tier] = tier_list(tier)
      end

      puts

      output
    end

    def generate_contribution_count(stages)
      puts 'Generating contribution counts...'

      milestones = gitlaborg.milestones('closed').select { |m| m['title'].match(/\d+\.\d+/) }
      milestones = milestones.reverse

      gitlaborg_ref = gitlaborg # Required to store a local copy since Middleman changes self when doing lazyloading of stages

      stage_contributions = {}
      stages.stages.each do |stagekey, stage|
        count = 0
        milestones.first(3).each do |m|
          contributed_mrs = gitlaborg_ref.merge_request_count(stagekey, m['title'], "Community contribution")
          count += contributed_mrs.count()
          puts "Contributions for #{m['title']}: #{contributed_mrs.count}"
        end

        stage_contributions[stagekey] = count
      end

      stage_contributions
    end

    def generate_stage_velocity(stages)
      puts 'Generating contribution counts...'

      milestones = gitlaborg.milestones('closed').select { |m| m['title'].match(/\d+\.\d+/) }
      milestones = milestones.reverse

      gitlaborg_ref = gitlaborg # Required to store a local copy since Middleman changes self when doing lazyloading of stages

      stage_velocity = {}
      stages.stages.each do |stagekey, stage|
        count = 0
        milestones.first(3).each do |m|
          merged_mrs = gitlaborg_ref.merge_request_count(stagekey, m['title'])
          count += merged_mrs.count()
          puts "Merged MRs for #{m['title']}: #{stage_velocity.count}"
        end

        stage_velocity[stagekey] = count
      end

      stage_velocity
    end

    def generate_milestones
      milestones = {}
      milestones['last'] = gitlaborg.milestones.select { |m| m['title'].match(/\d+\.\d+/) && Date.parse(m['due_date']) + 5 <= Date.today }.reverse.first
      milestones['next'] = gitlaborg.milestones.select { |m| m['title'].match(/\d+\.\d+/) && Date.parse(m['due_date']) + 5 > Date.today }.first['title']

      milestones
    end

    def seg_issues_list
      instance = GitLabInstance.new('GitLab.com')

      projects = edition + [
        GitLabProject.new('gitlab-org/incubation-engineering/apm/apm', instance),
        GitLabProject.new('gitlab-org/incubation-engineering/breach-and-attack-simulation/meta', instance),
        GitLabProject.new('gitlab-org/incubation-engineering/mobile-devops/readme', instance),
        GitLabProject.new('gitlab-org/incubation-engineering/five-minute-production/meta', instance),
        GitLabProject.new('gitlab-org/incubation-engineering/jamstack/meta', instance),
        GitLabProject.new('gitlab-org/incubation-engineering/mlops/meta', instance),
        GitLabProject.new('gitlab-org/incubation-engineering/okr/meta', instance),
        GitLabProject.new('gitlab-org/incubation-engineering/service-desk/meta', instance)
      ]

      projects.flat_map do |project|
        issues = project.wishlist_issues('SingleEngineerGroups', nil)
        issues.map do |issue|
          reach_label = extract_seg_priority_value(issue, 'Reach')
          reach_value, reach_color = extract_value_and_color(reach_label, :reach)

          impact_label = extract_seg_priority_value(issue, 'Impact')
          impact_value, impact_color = extract_value_and_color(impact_label, :impact)

          confidence_label = extract_seg_priority_value(issue, 'Confidence')
          confidence_value, confidence_color = extract_value_and_color(confidence_label, :confidence)

          effort_label = extract_seg_priority_value(issue, 'Effort')
          effort_value, effort_color = extract_value_and_color(effort_label, :effort)

          total = ((reach_value.to_f * impact_value.to_f * confidence_value.to_f) / effort_value.to_f).round(1) if reach_value && impact_value && confidence_value && effort_value && effort_color != 0
          {
            "title" => issue['title'],
            "web_url" => issue['web_url'],
            "labels" => issue['labels'],
            "reach_label" => reach_label,
            "reach_color" => reach_color,
            "impact_label" => impact_label,
            "impact_color" => impact_color,
            "confidence_label" => confidence_label,
            "confidence_color" => confidence_color,
            "effort_label" => effort_label,
            "effort_color" => effort_color,
            "total" => total
          }
        end
      end
    end

    def extract_value_and_color(label, rice_category)
      return nil unless label

      rice_value_hash = single_engineer_group_data.fetch(rice_category)
      rice_value_hash.fetch(label)
    end

    def extract_seg_priority_value(issue, attribute)
      label = issue['labels'].find { |l| l.start_with?(attribute) }
      label.split('::')[1].to_sym if label
    end

    private

    def issue_bullet(issue)
      output = "- [#{issue['title']}](#{issue['web_url']})"
      unless issue['labels'].include?('GitLab Free') || issue['labels'].include?('GitLab Core')
        output << ' <kbd>Premium</kbd>' if issue['labels'].include? 'GitLab Premium'
        output << ' <kbd>Ultimate</kbd>' if issue['labels'].include? 'GitLab Ultimate'
        output << ' <kbd>Highlight</kbd>' if issue['labels'].include? 'Kickoff Highlight'
      end
      output << "\n"
      output
    end

    def epic_bullet(epic)
      output = "- [#{epic['title']}](#{epic['web_url']})"
      unless epic['labels'].include?('GitLab Free') || epic['labels'].include?('GitLab Core')
        output << ' <kbd>Premium</kbd>' if epic['labels'].include? 'GitLab Premium'
        output << ' <kbd>Ultimate</kbd>' if epic['labels'].include? 'GitLab Ultimate'
        output << ' <kbd>Highlight</kbd>' if epic['labels'].include? 'Kickoff Highlight'
      end
      output << "\n"
      output
    end

    def tier_bullet(issue)
      output = "- [#{issue['title']}](#{issue['web_url']})"
      output << " <kbd>#{issue['milestone']['title']}</kbd>" if issue['milestone']
      output << "\n"
      output
    end

    def epic_web_url(group, epic)
      "#{group.group['web_url']}/-/epics/#{epic['iid']}"
    end

    def edition
      @edition ||= begin
        com = GitLabInstance.new('GitLab.com')
        gitlab = GitLabProject.new('gitlab-org/gitlab', com)
        omnibus = GitLabProject.new('gitlab-org/omnibus-gitlab', com)
        gitlab_chart = GitLabProject.new('gitlab-org/charts/gitlab', com)
        runner_chart = GitLabProject.new('gitlab-org/charts/gitlab-runner', com)
        runner = GitLabProject.new('gitlab-org/gitlab-runner', com)
        pages = GitLabProject.new('gitlab-org/gitlab-pages', com)
        [gitlab, omnibus, gitlab_chart, runner_chart, runner, pages]
      end
    end

    def gitlaborg
      @gitlaborg ||= begin
        com = GitLabInstance.new('GitLab.com')
        GitLabGroup.new('gitlab-org', com)
      end
    end

    def label_list(label, exclude: nil, editions: nil)
      output = ''

      editions = edition if editions.nil?

      editions.each do |project|
        issues = project.wishlist_issues(label, exclude)
        issues.each do |issue|
          output << issue_bullet(issue)
        end
      end
      output = "No current issues\n" if output.empty?
      output
    end

    def tier_list(label)
      output = ''
      issues = []

      edition.each do |project|
        issues += project.tier_issues(label)
      end
      issues.sort_by! do |issue|
        if issue.dig('milestone', 'due_date')
          Date.parse(issue['milestone']['due_date'])
        else
          Date.new(2050, 1, 1)
        end
      end
      issues.each do |issue|
        output << tier_bullet(issue)
      end

      output = "No current issues\n" if output.empty?
      output
    end
  end
end
