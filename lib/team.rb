require 'yaml'
require_relative './team/member'
require_relative './team/project'
require_relative './team/assignment'
require_relative './team/domain_expertise'

module Gitlab
  module Homepage
    class Team
      def members
        @members ||= Team::Member.all! do |member|
          Team::Project.all! do |project|
            member.assign(project) if member.involved?(project)
          end
        end
      end

      def projects
        @projects ||= Team::Project.all! do |project|
          Team::Member.all! do |member|
            project.assign(member) if member.involved?(project)
          end
        end
      end

      def departments
        @departments ||= begin
          Team::Member.all!.each_with_object({}) do |member, departments|
            member.departments.each do |department|
              departments[department] ||= { members: 0, vacancies: 0 }

              if member.type == 'vacancy'
                departments[department][:vacancies] += 1
              else
                departments[department][:members] += 1
              end
            end
          end.sort
        end
      end

      def countries
        @countries ||= begin
          members_by_country = Team::Member.all!.group_by(&:country_normalized)

          members_by_country.delete('Remote')
          members_by_country.delete(nil)

          members_by_country
            .map { |name, members| { name: name, count: members.count, info: members.first.country_info } }
            .sort_by { |c| c[:info]&.name || c[:name] }
        end
      end

      def direct_team(manager_role: nil, manager_slug: nil, role_regexp: nil, extra_slugs: [], department: nil)
        managers = if manager_slug
                     Team::Member.all!.find_all { |member| member.slug == manager_slug }
                   else
                     Team::Member.all!.find_all { |member| member.text_role == manager_role }
                   end

        return [] unless managers

        team_members = []
        managers.each do |manager|
          team_members += [manager] +
            Team::Member.no_vacancies.select { |member| member.reports_to == manager.slug && (role_regexp.nil? || member.text_role =~ role_regexp) && (department.nil? || member.departments.include?(department)) }
        end

        team_members + Team::Member.all!.find_all { |member| extra_slugs.include?(member.slug) }
      end

      def merge_request_coaches
        members.select(&:merge_request_coach?)
      end

      def role_matches(role_regexp:)
        Team::Member.no_vacancies.select { |member| member.text_role =~ role_regexp }
      end

      def department_matches(department:, member_type: nil)
        if department == 'Company'
          members
        elsif member_type
          Team::Member.all!.select { |member| (member.departments.include? department) && (member.type == member_type) }
        else
          Team::Member.all!.select { |member| member.departments.include? department }
        end
      end

      def division_matches(division:, member_type: nil)
        if member_type
          Team::Member.all!.select { |member| (member.division == division) && (member.type == member_type) }
        else
          Team::Member.all!.select { |member| member.division == division }
        end
      end

      def unique_departments
        departments = {}
        Team::Member.all!.each do |member|
          member.departments.each do |department|
            slug = department.downcase.gsub(/[^0-9a-z -]/i, '').squeeze(' ').tr(' ', '-')
            departments[slug] = department
          end
        end
        departments.sort.to_h
      end

      def as_csv(division: nil)
        CSV.generate do |csv|
          csv << [
            'Name',
            'GitLab handle',
            'Specialties',
            'Reports to',
            'Borrowed to',
            'Borrowing team',
            'Borrow end date',
            'Work priority 1',
            'Work priority 2'
          ]

          division_matches(division: division, member_type: "person").each do |member|
            work_priorities = member.work_priorities || []
            borrowed_to = Team::Member.find_by_slug(member.to_h.dig('borrow', 'to'))

            row = [
              member.name,
              member.gitlab,
              member.specialties.join("|"),
              Team::Member.find_by_slug(member.reports_to)&.name,
              borrowed_to&.name,
              borrowed_to&.specialty,
              member.to_h.dig('borrow', 'end_date'),
              work_priorities[0],
              work_priorities[1]
            ]

            csv << row
          end
        end
      end
    end
  end
end
