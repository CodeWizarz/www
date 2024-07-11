require 'forwardable'

module Gitlab
  module Homepage
    class Team
      class Assignment
        extend Forwardable

        attr_reader :member, :project

        delegate username: :member
        delegate domain_expertise: :member

        def initialize(member, project, role)
          @member = member
          @project = project
          @role = role.to_s

          @member.load_domain_expertise
        end

        def responsibility
          @role.split(' ')[0]
        end

        def responsibility_label
          # e.g. trainee_maintainer => trainee maintainer
          responsibility.tr('_', ' ')
        end

        def responsibility_anchor
          # e.g. trainee_maintainer => trainee-maintainer
          responsibility.tr('_', '-')
        end

        def description?
          !description.to_s.empty?
        end

        def description
          @role.split(' ')[1]
        end

        def owner?
          responsibility == 'owner'
        end

        def maintainer?
          responsibility == 'maintainer'
        end

        def trainee_maintainer?
          responsibility == 'trainee_maintainer'
        end

        def reviewer?
          responsibility == 'reviewer'
        end
      end
    end
  end
end
