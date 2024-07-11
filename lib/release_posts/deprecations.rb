require 'yaml'
require 'gitlab'
require_relative '../api_retry'

module ReleasePosts
  class Deprecations
    include Helpers
    include ApiRetry

    GITLAB_API_URL = 'https://gitlab.com/api/v4'.freeze

    def initialize(dryrun: ENV.fetch("DRYRUN", false))
      deprecations_dir = File.join(git_repo_path, 'data', 'release_posts')
      @deprecations_file = File.join(deprecations_dir, 'deprecations-index.yml')
      @is_dryrun = dryrun
    end

    def generate
      prepare
      connect
      save_deprecations
      unless dry_run?
        commit_deprecations
        push_deprecation_changes
      end
      cleanup
    end

    private

    def dry_run?
      @is_dryrun
    end

    def prepare
      dry_run_message = <<~MESSAGE
        *** DRY RUN ***
        This script will not push changes to the deprecations index to GitLab.
      MESSAGE

      log_info(dry_run_message) if dry_run?

      log_info("Fetching branches")
      git_fetch

      log_info('Set username and email')
      git_config('user.email', 'job+bot@gitlab.com')
      git_config('user.name', 'Bot')

      return if dry_run?

      log_info("Switching branch to #{next_release}")
      git_change_branch(next_release)
    end

    def cleanup
      log_info('Unset username and email')
      git_unset_config('user.email')
      git_unset_config('user.name')
    end

    def connect
      log_info("Connecting to GitLab...")

      Gitlab.configure do |config|
        config.endpoint = GITLAB_API_URL
        config.private_token = ENV['GITLAB_BOT_TOKEN'] || ENV['PRIVATE_TOKEN'] || ''
      end
    end

    def retreive_deprecations
      log_info("Retrieving deprecation files from API...")
      api_retry do
        deprecations = Gitlab
          .tree(GITLAB_PROJECT_ID, { path: 'data/deprecations' })
          .auto_paginate

        log_info("Loading deprecation files...")
        jobs = deprecations.map do |deprecation|
          Thread.new do
            next unless deprecation.path.end_with?("yml")

            built_deprecation = build_deprecation(deprecation.path)
            next unless built_deprecation.breaking_change

            Thread.current[:deprecations] = built_deprecation
          end
        end

        deps = jobs.each_with_object([]) do |job, all|
          job.join
          all << job[:deprecations] if job[:deprecations]
        end

        deps.compact.sort_by(&:announcement_milestone).reverse
      end
    end

    def formatted_deprecations
      retreive_deprecations.group_by(&:announcement_milestone).transform_values { |v| v.map(&:title) }.to_yaml
    end

    def save_deprecations
      File.write(@deprecations_file, formatted_deprecations)
    end

    def commit_deprecations
      git_add(@deprecations_file)
      git_commit("Updated deprecations content")
    end

    def push_deprecation_changes
      git_push("https://jobbot:#{ENV.fetch('GITLAB_BOT_TOKEN', nil)}@gitlab.com/gitlab-com/www-gitlab-com.git", next_release)
    end

    def fetch_release_branches
      (git_branch_list('origin/release-*') || '').split
    end

    def next_release
      release_branch = fetch_release_branches
        .select { |name| name =~ %r{\Aorigin/release-\d+-\d+\Z} }
        .map { |name| name.delete_prefix('origin/') }
        .max_by { |name| sort_by_version(name) }

      unless release_branch
        log_error("Release branch is missing!")
        exit 1
      end

      log_info("Detected release: #{release_branch}")
      release_branch
    end

    def sort_by_version(release)
      version = release.match(/(\d+)-(\d+)/)
      [version[1].to_i, version[2].to_i]
    end

    def build_deprecation(path)
      Deprecation.new(path, GITLAB_PROJECT_ID)
    rescue StandardError => e
      log_error("Error loading deprecation: #{path}", e)
    end
  end
end
