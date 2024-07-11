#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../../app/services/update_releases_service"

namespace :release do
  namespace :ee do
    # gitlab-org/gitlab Releases page: https://gitlab.com/gitlab-org/gitlab/-/releases
    desc "Updates the gitlab-org/gitlab project's Releases page using the release posts found in this project"
    task :update_project_releases_page do |_t, args|
      update_project_releases_page('GITLAB_EE_PROJECT_ID', is_ee: true)
    end
  end

  namespace :foss do
    # gitlab-org/gitlab-foss Releases page: https://gitlab.com/gitlab-org/gitlab-foss/-/releases
    desc "Updates the gitlab-org/gitlab-foss project's Releases page using the release posts found in this project"
    task :update_project_releases_page do |_t, args|
      update_project_releases_page('GITLAB_FOSS_PROJECT_ID', is_ee: false)
    end
  end

  def update_project_releases_page(project_id_var, is_ee:)
    project_id = ENV[project_id_var].to_i
    token = ENV['GITLAB_BOT_TOKEN']

    raise "Set #{project_id_var} and GITLAB_BOT_TOKEN environment variables" if project_id.zero? || !token

    UpdateReleasesService.new(project_id, token, is_ee).execute

    puts "✅ Successfully updated all releases."
  end
end
