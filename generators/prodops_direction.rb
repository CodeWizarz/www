require_relative '../lib/gitlab/file_cache'
require 'active_support/core_ext/date/calculations'
require 'active_support/core_ext/numeric/time'
require 'active_support/notifications'

require 'colorize'
require 'generators/direction'

module Generators
  class ProdOpsDirection < Direction
    attr_accessor :inc_epics, :inc_issues, :inc_merge_reqs
    def initialize
      @inc_epics = false
      @inc_issues = true
      @inc_merge_reqs = false
    end

    class MilestoneFilter < Direction::MilestoneFilter
      attr_accessor :filtering_date, :milestones_by_expired_state

      def initialize(milestones)
        self.filtering_date = Date.today.months_ago(12)
        self.milestones_by_expired_state =
          milestones
            .map(&method(:parse_due_date))
            .group_by(&method(:expired_state))
            .transform_values(&method(:sort_by_due_date))
      end
    end

    class GitLabProject < Direction::GitLabProject
      def milestone_direction_issues(milestone_id, label)
        result = []
        result += @instance.get("projects/#{@id}/issues", true, milestone: milestone_id, labels: label, confidential: 'false', per_page: 100)
        result
      end

      def milestone_direction_merge_reqs(milestone_id, label, state = 'all')
        result = []
        result += @instance.get("projects/#{@id}/merge_requests", true, milestone: milestone_id, state: state, labels: label, per_page: 100)
        result
      end
    end

    class GitLabGroup
      def initialize(id, instance, inc_epics, inc_issues, inc_merge_reqs)
        @id = id
        @instance = instance
        @name = instance.name
        @inc_epics = inc_epics
        @inc_issues = inc_issues
        @inc_merge_reqs = inc_merge_reqs
      end

      def milestones(state = 'active')
        result = @instance.get("groups/#{@id}/milestones", true, state: state, per_page: 100)

        MilestoneFilter.new(result)[state]
      end

      # finds all Direction epics that have a fixed or inherited due date that falls
      # between the given milestone start and end dates
      def milestone_direction_epics(milestone, label)
        epics = []
        results = []
        return results unless @inc_epics

        epics += @instance.get("groups/#{@id}/epics", true, labels: label, confidential: 'false', per_page: 100)
        epics.each do |epic|
          next if epic['due_date_from_inherited_source'].nil? && epic['due_date'].nil?

          if !epic['due_date_from_inherited_source'].nil? && (epic['due_date_from_inherited_source'] > milestone['start_date']) && (epic['due_date_from_inherited_source'] <= milestone['due_date'])
            results.push(epic)
            next
          end
          next if epic['due_date'].nil?

          if (epic['due_date'] > milestone['start_date']) && (epic['due_date'] <= milestone['due_date'])
            results.push(epic)
          end
        end
        results
      end
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
          output = "##### #{title} (" + display_date.strftime('%Y-%m-%d') + ")\n\n"
        end
      rescue ArgumentError
        # milestone title is not a normal release number, do not include extra date info
        output = "##### #{title}\n\n"
      end
      output
    end

    def format_milestone_due_date(due_date)
      display_date = Date.parse(due_date) + 5.days
      output = display_date.strftime('%Y-%m-%d')
      output
    end

    def get_issues(edition, milestone, label)
      issues = []
      if @inc_issues
        edition.each do |project|
          issues += project.milestone_direction_issues(milestone['title'], label)
        end
      end
      issues
    end

    def get_merge_reqs(edition, milestone, label, state = 'all')
      merge_reqs = []
      if @inc_merge_reqs
        edition.each do |project|
          merge_reqs += project.milestone_direction_merge_reqs(milestone['title'], label, state)
        end
      end
      merge_reqs
    end

    def get_direction_buckets(issues, epics, merge_reqs, label)
      buckets = {}
      issues.each do |issue|
        buckets[label] = {} if buckets[label].nil?
        buckets[label]['issues'] = [] if buckets[label]['issues'].nil?
        buckets[label]['issues'] << issue if label.split(',').all? { |i| issue['labels'].include?(i) }
      end
      epics.each do |epic|
        buckets[label] = {} if buckets[label].nil?
        buckets[label]['epics'] = [] if buckets[label]['epics'].nil?
        buckets[label]['epics'] << epic if label.split(',').all? { |i| epic['labels'].include?(i) }
      end
      merge_reqs.each do |merge_req|
        buckets[label] = {} if buckets[label].nil?
        buckets[label]['merge_reqs'] = [] if buckets[label]['merge_reqs'].nil?
        buckets[label]['merge_reqs'] << merge_req if label.split(',').all? { |i| merge_req['labels'].include?(i) }
      end
      buckets
    end

    def fill_epics(milestone, buckets, label)
      direction_epics = ''
      return direction_epics if buckets[label]['epics'].nil? || (@inc_epics == false)

      buckets[label]['epics'].each do |epic|
        direction_epics += tier_bullet(epic)
      end
      direction_epics
    end

    def fill_issues(milestone, buckets, label)
      direction_issues = ''
      return direction_issues if buckets[label]['issues'].nil? || (@inc_issues == false)

      buckets[label]['issues'].each do |issue|
        direction_issues += tier_bullet(issue)
      end
      direction_issues
    end

    def fill_merge_reqs(milestone, buckets, label)
      direction_merge_reqs = ''
      return direction_merge_reqs if buckets[label]['merge_reqs'].nil? || (@inc_merge_reqs == false)

      buckets[label]['merge_reqs'].each do |merge_req|
        direction_merge_reqs += tier_bullet(merge_req)
      end
      direction_merge_reqs
    end

    # this is specifically for Product Operations direction items, no other stages
    # rubocop: disable Metrics/AbcSize
    def fill_recent(label)
      direction_recent = ''
      # grabs at most 2 milestones that are still 'active' but have expired (past due date)
      recent_org = []
      recent_com = []
      recent_org += gitlaborg.milestones('active').select { |m| m['title'].match(/\d+\.\d+/) && m['expired'] == true }
      recent_com += gitlabcom.milestones('active').select { |m| m['title'].match(/\d+\.\d+/) && m['expired'] == true }

      recent = 0
      recent_org.each do |ms|
        next if recent >= 2

        issues = get_issues(edition_prodops, ms, label)
        merge_reqs = get_merge_reqs(edition_prodops, ms, label)
        epics = gitlaborg.milestone_direction_epics(ms, label)
        recent_com.each do |ms_com|
          if ms_com['title'] == ms['title']
            epics += gitlabcom.milestone_direction_epics(ms_com, label)
          end
        end

        next if issues.empty? && merge_reqs.empty? && epics.empty?

        direction_recent += format_direction_header(ms['title'], ms['due_date'])

        # run through all issues and epics and throw in relevant bucket (stage)
        buckets = get_direction_buckets(issues, epics, merge_reqs, label)

        # Now unfold the bins in order, so all the epics and issues are under their stage
        # Epics will come before issues for stages set to true in INCLUDE_EPICS hash
        next unless buckets.count.positive?

        direction_recent += fill_epics(ms, buckets, label)
        direction_recent += fill_issues(ms, buckets, label)
        direction_recent += fill_merge_reqs(ms, buckets, label)
        direction_recent += "\n"
        recent += 1
      end
      direction_recent
    end

    def generate_prod_ops_direction(labels, include_epics = false, include_merge_reqs = false)
      @inc_epics = include_epics
      @inc_merge_reqs = include_merge_reqs

      direction_output = Hash.new { |hash, key| hash[key] = Hash.new(&hash.default_proc) }

      labels.each do |label|
        direction_output[label]["all"] = ''
        direction_output[label]["recent"] = fill_recent(label)
      end

      gitlaborg.milestones.each do |ms|
        # subtract 5 days because the release's milestone due date is set to the freeze, not release date
        next unless ms['due_date'] && Date.parse(ms['due_date']) >= Date.today - 5.days

        labels.each do |label|
          issues = get_issues(edition_prodops, ms, label)
          merge_reqs = get_merge_reqs(edition_prodops, ms, label)
          epics = gitlaborg.milestone_direction_epics(ms, label)
          gitlabcom.milestones.each do |ms_com|
            if ms_com['title'] == ms['title']
              epics += gitlabcom.milestone_direction_epics(ms_com, label)
            end
          end

          next if issues.empty? && merge_reqs.empty? && epics.empty?

          direction_output[label]["all"] += format_direction_header(ms['title'], ms['due_date'])

          # run through all issues and epics and throw in relevant bucket (stage)
          buckets = get_direction_buckets(issues, epics, merge_reqs, label)

          # Now unfold the bins in order, so all the epics and issues are under their stage
          # Epics will come before issues for stages set to true in INCLUDE_EPICS hash
          next unless buckets.count.positive?

          direction_output[label]["all"] += fill_epics(ms, buckets, label) unless buckets[label]['epics'].nil?
          direction_output[label]["all"] += fill_issues(ms, buckets, label) unless buckets[label]['issues'].nil?
          direction_output[label]["all"] += fill_merge_reqs(ms, buckets, label) unless buckets[label]['merge_reqs'].nil?

          direction_output[label]["all"] << "\n"
        end
      end
      direction_output
    end

    def init_milestone_label(milestone_items, label, milestone)
      milestone_items[label]["all"] = '' if milestone_items[label]["all"].empty?
      milestone_items[label][milestone['title']]["content"] = '' if milestone_items[label][milestone['title']].empty?
      milestone_items[label][milestone['title']]["date"] = '' if milestone_items[label][milestone['title']].empty?
      milestone_items[label]
    end

    def labeled_items_by_milestone(labels, include_epics = false, include_issues = true, include_merge_reqs = false)
      @inc_epics = include_epics
      @inc_issues = include_issues
      @inc_merge_reqs = include_merge_reqs

      milestone_items = Hash.new { |hash, key| hash[key] = Hash.new(&hash.default_proc) }

      gitlaborg.milestones.each do |ms|
        labels.each do |label|
          milestone_items[label] = init_milestone_label(milestone_items, label, ms)
          issues = get_issues(edition_prodops, ms, label)
          merge_reqs = get_merge_reqs(edition_prodops, ms, label, 'merged') # only include MRs that are merged
          epics = gitlaborg.milestone_direction_epics(ms, label)
          gitlabcom.milestones.each do |ms_com|
            if ms_com['title'] == ms['title']
              epics += gitlabcom.milestone_direction_epics(ms_com, label)
            end
          end

          next if issues.nil? && merge_reqs.nil? && epics.nil?

          # run through all issues and epics and throw in relevant bucket (stage)
          buckets = get_direction_buckets(issues, epics, merge_reqs, label)

          # Now unfold the bins in order, so all the epics and issues are under their stage
          # Epics will come before issues for stages set to true in INCLUDE_EPICS hash
          next unless buckets.count.positive?

          milestone_items[label][ms['title']]["content"] += fill_epics(ms, buckets, label) unless buckets[label]['epics'].nil? || (include_epics == false)
          milestone_items[label][ms['title']]["content"] += fill_issues(ms, buckets, label) unless buckets[label]['issues'].nil? || (include_issues == false)
          milestone_items[label][ms['title']]["content"] += fill_merge_reqs(ms, buckets, label) unless buckets[label]['merge_reqs'].nil? || (include_merge_reqs == false)

          milestone_items[label][ms['title']]["content"] << "\n" unless milestone_items[label][ms['title']]["content"].empty?
          milestone_items[label][ms['title']]["date"] = format_milestone_due_date(ms['due_date']) unless milestone_items[label][ms['title']]["content"].empty?
        end
      end
      milestone_items
    end

    def all_labeled_items(labels, include_epics = false, include_issues = true, include_merge_reqs = false)
      @inc_epics = include_epics
      @inc_issues = include_issues
      @inc_merge_reqs = include_merge_reqs

      milestone_items = Hash.new { |hash, key| hash[key] = Hash.new(&hash.default_proc) }

      gitlaborg.milestones.each do |ms|
        labels.each do |label|
          milestone_items[label] = init_milestone_label(milestone_items, label, ms)
          issues = get_issues(edition_prodops, ms, label)
          merge_reqs = get_merge_reqs(edition_prodops, ms, label)
          epics = gitlaborg.milestone_direction_epics(ms, label)
          gitlabcom.milestones.each do |ms_com|
            if ms_com['title'] == ms['title']
              epics += gitlabcom.milestone_direction_epics(ms_com, label)
            end
          end

          next if issues.nil? && merge_reqs.nil? && epics.nil?

          milestone_items[label]["all"] += format_direction_header(ms['title'], ms['due_date'])

          # run through all issues and epics and throw in relevant bucket (stage)
          buckets = get_direction_buckets(issues, epics, merge_reqs, label)

          # Now unfold the bins in order, so all the epics and issues are under their stage
          # Epics will come before issues for stages set to true in INCLUDE_EPICS hash
          next unless buckets.count.positive?

          milestone_items[label]["all"] += fill_epics(ms, buckets, label) unless buckets[label]['epics'].nil? || (include_epics == false)
          milestone_items[label]["all"] += fill_issues(ms, buckets, label) unless buckets[label]['issues'].nil? || (include_issues == false)
          milestone_items[label]["all"] += fill_merge_reqs(ms, buckets, label) unless buckets[label]['merge_reqs'].nil? || (include_merge_reqs == false)
          milestone_items[label]["all"] << "\n"
        end
      end
      milestone_items
    end
    # rubocop: enable Metrics/AbcSize

    private

    def tier_bullet(obj)
      output = "- [#{obj['title']}](#{obj['web_url']})\n"
      output
    end

    def edition_prodops
      @edition_prodops ||= begin
        com = Generators::Direction::GitLabInstance.new('GitLab.com')
        gitlab_org = GitLabProject.new('gitlab-org/gitlab', com)
        product = GitLabProject.new('gitlab-com/Product', com)
        gitlab_com = GitLabProject.new('gitlab-com/www-gitlab-com', com)
        [gitlab_org, product, gitlab_com]
      end
    end

    def gitlaborg
      @gitlaborg ||= begin
        com = Generators::Direction::GitLabInstance.new('GitLab.com')
        GitLabGroup.new('gitlab-org', com, @inc_epics, @inc_issues, @inc_merge_reqs)
      end
    end

    def gitlabcom
      @gitlabcom ||= begin
        com = Generators::Direction::GitLabInstance.new('GitLab.com')
        GitLabGroup.new('gitlab-com', com, @inc_epics, @inc_issues, @inc_merge_reqs)
      end
    end
  end
end
