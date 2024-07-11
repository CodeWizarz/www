require_relative 'rest_api_helper'
require_relative 'shared'
require 'fileutils'
require 'gitlab'
require_relative '../gitlab_api_helper'

module Cleanup
  class DeleteMergedBranches
    include Cleanup::RestApiHelper
    include Cleanup::Shared

    def process
      puts "Starting #{self.class.name} at #{Time.now.utc}..."
      puts "THIS IS A DRY RUN" if dry_run?
      puts "Finding merged branches for project #{project_id}...\n\n"

      branches = load_branches

      puts "Deleting the following branches:\n"
      pp branches

      branches.each do |branch|
        puts "Deleting branch #{branch}"
        delete_branch(project_id, branch, dry_run?)
      end
    end

    private

    def load_branches
      repo_root_dir = ENV.fetch('CLEANUP_REPO_ROOT_DIR')

      for_each_ref_output = FileUtils.cd(repo_root_dir) do
        `git for-each-ref --merged=master 'refs/remotes/origin'`
      end

      branches = for_each_ref_output.split("\n").map do |line|
        line.split(" commit\trefs/remotes/origin/").last
      end

      branches.delete('HEAD')
      branches.delete('master')

      branches
    end
  end
end
