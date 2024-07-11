# frozen_literal: true

require 'set'
require 'json'

module Gitlab
  module Homepage
    class OrgChart
      MEMBERS_GROUPING_KEYS = [
        ['reports_to'],
        %w[borrow to]
      ].freeze
      ALLOWED_WORK_PRIORITIES =
        JSON.parse(
          File.read(
            File.expand_path(
              '../../data/schemas/team_member.schema.json',
              __dir__)))
          .dig('properties', 'work_priorities', 'items', 'enum')
          .freeze

      attr_reader :nodes, :members_grouped_by

      Node = Struct.new(:member, :reports) do
        def total_count
          @total_count ||= reports.map(&:total_count).sum + direct_count
        end

        def direct_count
          @direct_count ||= reports.count { |r| !r.vacancy? }
        end

        def vacancies
          @vacancies ||= reports.map(&:vacancies).sum + reports.count(&:vacancy?)
        end

        def to_list
          [self] + reports.flat_map(&:to_list)
        end

        def vacancy?
          member['type'] == 'vacancy'
        end
      end

      def initialize(team)
        @nodes = team.to_h { |person| [person['slug'], person] }
        @members_grouped_by = MEMBERS_GROUPING_KEYS.each_with_object({}) do |keys, result|
          result[keys] = team.group_by do |person|
            person.dig(*keys)
          end
        end
      end

      def validate
        @validate ||= [
          verify_non_empty!,
          verify_valid_managers!('reports_to'),
          verify_valid_borrow!,
          verify_work_priorities!,
          verify_no_cycles!
        ].flatten.compact
      end

      def validate!
        raise 'Invalid' unless validate.empty?
      end

      def forest
        validate! # only valid to call after validation

        @forest ||= tree({ 'slug' => nil }).reports
      end

      private

      def tree(person)
        nodes = members_grouped_by.fetch(['reports_to']).fetch(person['slug'], []).map { |p| tree(p) }
        nodes = nodes.sort_by { |n| [-n.total_count, n.member['slug']] }
        Node.new(person, nodes)
      end

      def verify_non_empty!
        return if nodes.any?

        "Team is empty"
      end

      def verify_valid_managers!(*keys)
        managers = members_grouped_by.fetch(keys) # we can use fetch because it must be defined
        field_name = keys.join('.') # this can construct the same field name we have
        missing_manager_slugs = managers.keys.compact - nodes.keys
        orphans = missing_manager_slugs.flat_map do |missing_manager_slug|
          managers[missing_manager_slug].map { |report| "#{missing_manager_slug}: #{report['slug']} (#{report['name']})" }
        end

        return if missing_manager_slugs.none?

        <<~MSG
          Missing managers!
          ---------------------

          The following managers are missing:
          #{missing_manager_slugs.map { |slug| " - #{slug}" }.join("\n")}

          This could be a typo in a `#{field_name}` line, or perhaps
          the manager was removed and the reports haven't been
          updated? Please also make sure the name of the manager
          matches the name of their team member `yml` file.

          The reports of these managers are:
          #{orphans.map { |str| " - #{str}" }.join("\n")}
        MSG
      end

      def verify_valid_borrow!
        [
          verify_valid_managers!('borrow', 'to'),
          verify_valid_borrow_end_dates!
        ]
      end

      def verify_valid_borrow_end_dates!
        invalid_borrow_end_dates = nodes.each_with_object([]) do |(slug, node), memo|
          borrow_end_date = node.dig('borrow', 'end_date')
          next unless borrow_end_date
          next if borrow_end_date.is_a?(Date)

          begin
            Date.parse(borrow_end_date)
          rescue Date::Error
            memo << " - #{slug}: '#{borrow_end_date}'"
          end
        end

        return if invalid_borrow_end_dates.none?

        <<~MSG
          Invalid borrow end dates!
          -------------------------

          The following borrow end dates are invalid:
          #{invalid_borrow_end_dates.join("\n")}

          Valid format for `borrow.end_date` is 'YYYY-MM-DD'.
        MSG
      end

      def verify_work_priorities!
        invalid_work_priorities = nodes.each_with_object([]) do |(slug, node), memo|
          work_priorities = node['work_priorities'] || []

          work_priorities.each do |work_priority|
            memo << "- #{slug}: '#{work_priority}'" unless ALLOWED_WORK_PRIORITIES.include?(work_priority)
          end
        end

        return if invalid_work_priorities.none?

        <<~MSG
          Invalid work priorities!
          -------------------------

          The following work priorities are invalid:
          #{invalid_work_priorities.join("\n")}

          Allowed work priorities are:
          #{ALLOWED_WORK_PRIORITIES.map { |priority| " - #{priority}" }.join("\n")}
        MSG
      end

      def verify_no_cycles!
        return unless cycle

        <<~MSG
          Cycle found in org-chart!
          -------------------------

          The org-chart should not have any cycles. We found the following cycle:

          #{cycle.join(' --[reports_to]--> ')}
        MSG
      end

      def cycle
        return @cycle if defined? @cycle

        @cycle = begin
          seen = Set.new
          nodes.values.each do |node|
            next if seen.include?(node['slug'])

            (kind, path) = path_to_root(node)
            path.each { |slug| seen << slug }

            return path if kind == :cycle
          end

          nil
        end
      end

      def path_to_root(node)
        path = [node['slug']]
        curr = node
        while manager_slug = curr['reports_to']
          manager = nodes[manager_slug]
          return [:missing_manager, path] if manager.nil? # see verify_valid_managers!
          return [:cycle, path] if path.include?(manager_slug)

          path.push(manager_slug)
          curr = manager
        end

        [:linear, path]
      end
    end
  end
end
