require 'countries'
require_relative './yaml'

module Gitlab
  module Homepage
    class Team
      class Member
        include Comparable
        attr_reader :assignments, :domain_expertise

        DEPARTMENTS_GROUP_PATTERN = / Group$/i
        DEPARTMENTS_TEAM_PATTERN = /( BE| FE)? Team$/i # For "BE Team", "FE Team", or just "Team"
        PATH_TO_IMAGES = '/images/team/'.freeze
        PLACEHOLDER_IMAGE = 'gitlab-logo-extra-whitespace.png'.freeze

        UNMANAGED_ROLES = [
          'Advisor',
          'Board of Directors',
          '<a href="https://handbook.gitlab.com/job-families/board-of-directors/board_member/">Board of Directors</a>',
          'Core Team member',
          'Board Observer',
          'Lead Independent Director',
          'Lead Independent Director, <a href="https://handbook.gitlab.com/job-families/board-of-directors/board_member/">Board of Directors</a>'
        ].freeze

        def self.normalize_country(country)
          case country
          when 'USA', 'US'
            'United States'
          when 'The Netherlands'
            'Netherlands'
          when 'UK', 'GB', 'Great Britain'
            'United Kingdom'
          when 'NZ'
            'New Zealand'
          else
            country
          end
        end

        def self.all!
          @members ||= ::Gitlab::Homepage::Team::Yaml.new.build_team

          @titles ||= {}.tap do |hash|
            @members.each do |member|
              hash[member['slug']] = member['role'] if member['slug']
            end
          end

          @members.map do |data|
            reports_to = data['reports_to']
            data['reports_to_title'] = @titles[reports_to] if reports_to
            new(data).tap { |member| yield member if block_given? }
          end
        end

        def self.no_vacancies
          @no_vacancies ||= all!.reject { |member| member.name == 'New Vacancy' }
        end

        def self.find_by_slug(slug)
          return unless slug

          no_vacancies.find { |member| member.slug == slug }
        end

        def initialize(data)
          @data = data
          @assignments = []
          @domain_expertise = []
        end

        def to_h
          @data
        end

        def [](key)
          @data[key.to_s]
        end

        def <=>(other)
          [vacancy_for_sort, start_date_for_sort] <=> [other.vacancy_for_sort, other.start_date_for_sort]
        end

        def ==(other)
          slug == other.slug
        end
        alias_method :eql?, :==

        def hash
          [self.class, slug].hash
        end

        # This needs to match the implementation of the anchor key in OrgChart#build_json_data
        def anchor
          gitlab || slug
        end

        def avatar_url
          ::File.join(PATH_TO_IMAGES, avatar_filename)
        end

        def avatar_filename
          picture_name = @data.fetch('picture')
          # the placeholder image is never cropped, and we only crop images in CI
          return picture_name if picture_name.include?(PLACEHOLDER_IMAGE) || !ENV['CI']

          ::File.basename(picture_name, ::File.extname(picture_name)) + "-crop.jpg"
        end

        def username
          return unless @data.key?('gitlab')

          @data.fetch('gitlab')
        end

        def source_file_path
          "data/team_members/person/#{slug[0]}/#{slug}.yml"
        end

        def involved?(project)
          project_roles.has_key?(project.key)
        end

        def text_role
          @data.fetch('role', '').gsub(/<[^>]+>/, '')
        end

        def project_roles
          @project_roles ||= @data.fetch('projects', {}).map { |project, roles| [project, Array(roles)] }.to_h
        end

        def assign(project)
          project_roles[project.key].each do |role|
            @assignments << Team::Assignment.new(self, project, role)
          end
        end

        def departments
          @departments ||= @data.fetch('departments', [])
        end

        def departments_group
          @departments_group ||= departments.find { |department| department.match?(DEPARTMENTS_GROUP_PATTERN) }
        end

        def departments_team
          @departments_team ||= departments.find { |department| department.match?(DEPARTMENTS_TEAM_PATTERN) }
        end

        def in_department?(*deps)
          (deps & departments).present?
        end

        def specialties
          Array(specialty)
        end

        def group
          if departments_group
            departments_group.gsub(DEPARTMENTS_GROUP_PATTERN, '')
          elsif departments_team
            departments_team.gsub(DEPARTMENTS_TEAM_PATTERN, '')
          else
            'None'
          end
        end

        def managed?
          reports_to.present? || vacancy? || in_unmanaged_role?
        end

        def merge_request_coach?
          departments.any? { |department| department.match?(/merge request coach/i) }
        end

        def in_unmanaged_role?
          UNMANAGED_ROLES.include?(role)
        end

        def country_normalized
          self.class.normalize_country(@data['country'])
        end

        def country_info
          @country_info ||= ISO3166::Country.find_country_by_name(country_normalized)
        end

        def start_date_for_sort
          Date.today
        end

        def vacancy_for_sort
          vacancy? ? 1 : 0
        end

        def person?
          type == 'person'
        end

        def vacancy?
          type == 'vacancy'
        end

        def acting?
          role.include?('(Acting)')
        end

        def job_families
          return [] if role.nil?

          # This regex consists of:
          # 1. A positive lookbehind looking for `href="`
          # 2. The actual text to be captured (any characted non-greedy)
          # 3. A positive lookabead looking for a closing `"`
          # It is done this way because lookbehinds/lookaheads don't create capturing groups
          # (though we could have also used non-capturing groups `(?:stuff)`)
          match = role.scan(/(?<=href=").+?(?=")/)

          return [] unless match.any?

          match.map do |href|
            href = href.gsub(/#.+/, '')
            href.end_with?('/') ? href : "#{href}/"
          end.compact.sort
        end

        def load_domain_expertise
          member_expertise = @data.fetch('domain_expertise', [])

          return unless member_expertise.any?

          Team::DomainExpertise.all!.each do |domain|
            unless @domain_expertise.any? { |d| d.key == domain.key }
              @domain_expertise << domain if member_expertise.include?(domain.key)
            end
          end
        end

        ##
        # Middeman Data File objects compatibility
        #
        def method_missing(name, *args, &block) # rubocop:disable Style/MethodMissingSuper
          @data[name.to_s]
        end

        def respond_to_missing?(method_name, include_private = false)
          @data.include?(method_name.to_s) || super
        end
      end
    end
  end
end
