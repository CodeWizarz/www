require_relative 'rest_api_helper'
require_relative 'shared'
require 'gitlab'
require_relative '../gitlab_api_helper'

module Cleanup
  class DeleteStaleMrBranches
    include Cleanup::RestApiHelper
    include Cleanup::Shared

    # rubocop: disable Metrics/AbcSize
    def process
      puts "Starting #{self.class.name} at #{Time.now.utc}..."
      puts "THIS IS A DRY RUN" if dry_run?
      puts "Finding open, stale Merge Requests for project #{project_id} which have label '#{label_title}'...\n\n"

      stale_labeled_mrs = stale_labeled_merge_requests(project_id, label_title)

      # log out MRs which will be processed
      puts "\n"
      total_stale_mrs = stale_labeled_mrs.length
      puts "Found #{total_stale_mrs} open, stale Merge Requests to process:"
      pp stale_labeled_mrs
      puts "\n"

      puts "Processing #{total_stale_mrs} MRs which are open and have the label '#{label_title}'...\n\n"

      mrs_with_current_project_branches = []
      mrs_with_fork_branches = []
      mrs_with_missing_branches = []
      stale_labeled_mrs.each_with_index do |mr, index|
        source_branch = mr.fetch(:source_branch)
        mr_iid = mr.fetch(:iid)

        branch_location = mr.fetch(:branch_location)
        if branch_location == :current_project
          puts "Branch #{source_branch} from MR #{mr_iid} exists, it will be deleted and the MR will be automatically closed (#{index + 1} of #{total_stale_mrs})."
          mrs_with_current_project_branches.push(mr)
        elsif branch_location == :fork
          puts "!!! Branch #{source_branch} from MR #{mr_iid} is in forked source project ID #{mr.fetch(:source_project_id)}. MR will be closed without deleting branch (#{index + 1} of #{total_stale_mrs})."
          mrs_with_fork_branches.push(mr)
        elsif branch_location == :missing
          puts "!!! Branch #{source_branch} from MR #{mr_iid} does not exist! MR will be manually closed without deleting branch (#{index + 1} of #{total_stale_mrs})."
          mrs_with_missing_branches.push(mr)
        else
          raise "Invalid value '#{branch_location}' for mr[:branch_location]"

        end
      end

      if mrs_with_current_project_branches.present?
        process_mrs_with_current_project_branches(mrs_with_current_project_branches)
      end

      if mrs_with_fork_branches.present?
        process_mrs_with_fork_project_branches(mrs_with_fork_branches)
      end

      if mrs_with_missing_branches.present?
        process_mrs_with_missing_project_branches(mrs_with_missing_branches)
      end

      puts "\n\n\n ======================= SUMMARY =======================\n\n\n"

      puts "\nDeleted all existing branches for open, stale Merge Requests for project #{project_id} which have label '#{label_title}' at #{Time.now.utc}.\n\n"

      if mrs_with_fork_branches.present?
        puts "!!! The following MR(s) had branches on forks. They were closed without deleting the branch."
        pp mrs_with_fork_branches
      end

      # rubocop: disable Style/GuardClause
      if mrs_with_missing_branches.present?
        puts "!!! The following MR(s) had missing branches. They were closed without deleting the branch."
        pp mrs_with_missing_branches
      end
      # rubocop: enable Style/GuardClause
    end
    # rubocop: enable Metrics/AbcSize

    private

    def process_mrs_with_current_project_branches(mrs_with_current_project_branches)
      puts "\nProcessing to delete #{mrs_with_current_project_branches.length} branches for MRs with current project branches...\n\n"
      mrs_with_current_project_branches.each_with_index do |mr, index|
        source_branch = mr.fetch(:source_branch)
        mr_iid = mr.fetch(:iid)
        msg = "Deleting branch #{source_branch} from MR #{mr_iid} (#{index + 1} of #{mrs_with_current_project_branches.length})."
        print '[DRY RUN - NOT UPDATING] ' if dry_run?
        puts msg
        delete_branch(project_id, source_branch, dry_run?)
      end
    end

    def process_mrs_with_fork_project_branches(mrs_with_fork_branches)
      puts "\nProcessing to close #{mrs_with_fork_branches.length} MRs with fork branches...\n\n"
      mrs_with_fork_branches.each_with_index do |mr, index|
        mr_iid = mr.fetch(:iid)
        msg = "Closing MR #{mr_iid} with fork branch (#{index + 1} of #{mrs_with_fork_branches.length})."
        print '[DRY RUN - NOT UPDATING] ' if dry_run?
        puts msg
        close_merge_request(project_id, mr_iid, dry_run?)
      end
    end

    def process_mrs_with_missing_project_branches(mrs_with_missing_branches)
      puts "\nProcessing to close #{mrs_with_missing_branches.length} MRs with missing branches...\n\n"
      mrs_with_missing_branches.each_with_index do |mr, index|
        mr_iid = mr.fetch(:iid)
        msg = "Closing MR #{mr_iid} with missing branch (#{index + 1} of #{mrs_with_missing_branches.length})."
        print '[DRY RUN - NOT UPDATING] ' if dry_run?
        puts msg
        close_merge_request(project_id, mr_iid, dry_run?)
      end
    end
  end
end
