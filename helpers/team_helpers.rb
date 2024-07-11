require_relative 'stable_unique_id'

module TeamHelpers
  include StableUniqueId

  def direct_team(manager_role: nil, manager_slug: nil, role_regexp: nil, extra_slugs: [], department: nil)
    members = Gitlab::Homepage.team.direct_team(manager_role: manager_role, manager_slug: manager_slug, role_regexp: role_regexp, extra_slugs: extra_slugs, department: department)

    partial('includes/team_member_table', locals: { team_members: members })
  end

  # Create a table of team members for a listed department
  def department_team(base_department:, remove_departments: [])
    members = Gitlab::Homepage.team.department_matches(department: base_department)

    remove_departments.each do |removal|
      members -= Gitlab::Homepage.team.department_matches(department: removal)
    end

    partial('includes/team_member_table', locals: { team_members: members })
  end

  # Accepts an array of regexp that will check the role of each member.
  # This allows for finding people in a specific group and those
  # who share their times between groups (e.g. Verify and Verify:Pipeline Security)
  def shared_team_members(role_regexps: [])
    members = []

    role_regexps.each do |role_regexp|
      members.push(*Gitlab::Homepage.team.role_matches(role_regexp: role_regexp))
    end

    partial('includes/team_member_table', locals: { team_members: members })
  end

  # FIXME: Replace usage in /handbook/engineering/development/dev/create/code-review/index.html.md.erb
  # from `product_group_table(group: 'Create:Code Review')` to `department_team(base_department: 'Create:Code Review')`
  # and remove this method.
  def product_group_table(group:)
    members = Gitlab::Homepage.team.department_matches(department: group)
    partial('includes/team_member_table', locals: { team_members: members })
  end

  # Get a list of team members for the group.
  def team_list_from_group(group:)
    Gitlab::Homepage.team.department_matches(department: group, member_type: "person")
  end

  # Create a paragraph for product group team members. Use HTML in case
  # Markdown isn't available in the destination file.
  def team_links_from_group(group:)
    team_list_from_group(group: group)
      .map { |member| "<a href=\"/company/team/##{member.gitlab}\">#{member.name}</a>" }
      .join(", ")
  end

  def team_member_count_from_group(group:)
    return 0 unless group

    team_list_from_group(group: group).length
  end

  def group_engineering_total_summary(group:)
    be_team = Gitlab::Homepage.team.department_matches(department: group.be_team_tag, member_type: "person")
    be_team.delete_if { |member| member.name == group.backend_engineering_manager }

    fe_team = Gitlab::Homepage.team.department_matches(department: group.fe_team_tag, member_type: "person")
    fe_team.delete_if { |member| member.name == group.frontend_engineering_manager }

    fs_team = Gitlab::Homepage.team.department_matches(department: group.fs_team_tag, member_type: "person")
    fs_team.delete_if { |member| member.name == group.fullstack_engineering_manager }

    teams = {
      'BE' => be_team,
      'FE' => fe_team,
      'FS' => fs_team
    }

    totals = teams.transform_values(&:length)
    totals.reject! { |_name, value| value.zero? }

    summary = totals.map { |name, total| "#{total} #{name}" }

    return summary.join(', ').to_s unless summary.empty?
  end

  # Stable counterparts for a team, found by matching roles against
  # role_regexp. Anyone in the direct team reporting to direct_manager_role will
  # be excluded.
  def stable_counterparts(role_regexp:, direct_manager_role: nil, manager_slug: nil, other_manager_roles: [])
    members =
      Gitlab::Homepage.team.role_matches(role_regexp: role_regexp) -
      Gitlab::Homepage.team.direct_team(manager_role: direct_manager_role, manager_slug: manager_slug)

    other_manager_roles.each do |manager|
      members -= Gitlab::Homepage.team.direct_team(manager_role: manager)
    end

    members = members.sort_by do |member|
      case member.role
      when /Product Manager/
        1
      when /Designer/
        2
      when /Writer/
        3
      when /Engineer/
        4
      else
        5
      end
    end

    partial('includes/team_member_table', locals: { team_members: members })
  end

  def department_member_and_vacancy_count(department, counts)
    vacancies = counts[:vacancies]
    count_string = counts[:members].to_s
    count_string << " + #{vacancies} #{'vacancy'.pluralize(vacancies)}" if vacancies.positive?

    "#{department} (#{count_string})"
  end

  def link_to_team_member(gitlab_handle)
    team_member = Gitlab::Homepage::Team::Member.all!.find { |person| person.anchor == gitlab_handle }
    link_to team_member.name, "/company/team/##{team_member.gitlab}" if team_member
  end

  # return a list of team members who have identified themselves as a mentor
  def mentors
    members = Gitlab::Homepage::Team::Member.all!.sort_by(&:name).select(&:mentor)
    partial('includes/team_member_table', locals: { team_members: members, include_expertise: true })
  end

  def team_member_links
    members = Gitlab::Homepage::Team::Member.all!

    members.map do |member|
      "[#{member.name}]: /company/team/##{member.gitlab}" if member.gitlab.present?
    end
  end
end
