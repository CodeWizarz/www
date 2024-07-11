module ProjectsHelper
  # rubocop: disable Style/MutableConstant
  MAINTAINER_GROUPS = {
    'database' => 'database',
    'frontend' => 'frontend',
    'backend' => 'rails-backend'
  }
  # rubocop: enable Style/MutableConstant

  def show_maintainers_link?(id, url)
    project_key, group = id

    project_key == 'gitlab' &&
      group == 'maintainers' &&
      MAINTAINER_GROUPS.include?(url)
  end

  def maintainer_url(url)
    "https://gitlab.com/groups/gitlab-org/maintainers/#{MAINTAINER_GROUPS[url]}/-/group_members?with_inherited_permissions=exclude"
  end
end
