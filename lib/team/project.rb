module Gitlab
  module Homepage
    class Team
      class Project
        attr_reader :key, :assignments

        def initialize(key, data)
          @key = key
          @data = data
          @assignments = []
        end

        def name
          @data.fetch('name')
        end

        def description
          @data.fetch('description')
        end

        def link
          @data.fetch('link')
        end

        def path
          @data.fetch('path')
        end

        def mirrors
          @data.fetch('mirrors', [])
        end

        def assign(member)
          member.project_roles[key].each do |role|
            @assignments << Team::Assignment.new(member, self, role)
          end
        end

        def owners
          sort_assignments_by_description_and_username(@assignments.select(&:owner?))
        end

        def trainee_maintainers
          sort_assignments_by_description_and_username(@assignments.select(&:trainee_maintainer?))
        end

        def maintainers
          sort_assignments_by_description_and_username(@assignments.select(&:maintainer?))
        end

        def reviewers
          sort_assignments_by_description_and_username(@assignments.select(&:reviewer?))
        end

        def self.all!
          @projects ||= YAML.load_file(File.expand_path('../../data/projects.yml', __dir__))

          @projects.map do |key, data|
            new(key, data).tap { |project| yield project if block_given? }
          end
        end

        private

        def sort_assignments_by_description_and_username(assignments)
          assignments.group_by(&:description).reduce([]) do |memo, (_, people)|
            memo + people.sort_by { |person| person.username.downcase }
          end
        end
      end
    end
  end
end
