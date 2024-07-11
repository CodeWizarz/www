require 'fileutils'
require 'csv'
require_relative 'rest_api_helper'
require_relative 'shared'
require_relative 'graphql_api_helper'

module Cleanup
  class DeleteStaleBranches
    include Cleanup::Shared
    include Cleanup::GraphqlApiHelper
    include Cleanup::RestApiHelper

    def process
      puts "Starting #{self.class.name} at #{Time.now.utc}..."
      puts "THIS IS A DRY RUN" if dry_run?

      stale_cutoff_timestamp_string = ENV['CLEANUP_STALE_CUTOFF_TIMESTAMP'] ||
        raise('ENV var CLEANUP_STALE_CUTOFF_TIMESTAMP is required, in ISO8601 strict format: "YYYY-MM-DDTHH:MM:SS+00:00"')
      stale_cutoff_timestamp = DateTime.iso8601(stale_cutoff_timestamp_string)

      puts "Finding stale branches for project #{project_full_path}...\n"

      # 1. find all stale branches
      all_branches = load_branches
      puts "Found #{all_branches.length} total branches.\n"
      stale_branches = filter_stale_branches(all_branches, stale_cutoff_timestamp)
      puts "Found #{stale_branches.length} stale branches.\n"

      # 2. Find branches for all MRs
      all_mrs = all_merge_requests(project_full_path)
      puts "Found #{all_mrs.length} total MRs.\n"

      # 3. Find all stale branches which are only associated with closed or stale MRs OR not associated with any MR, and include in branches to be deleted.
      stale_branches_by_branch_name = index_by_branch_name(stale_branches, :Branch)
      all_stale_branches_to_be_deleted = filter_branches_to_be_deleted(stale_branches_by_branch_name, all_mrs)
      puts "Found #{all_stale_branches_to_be_deleted.length} stale branches to be deleted.\n"

      # 4. Final processing of data for branches to be deleted
      all_stale_branches_to_be_deleted.each do |branch_entry|
        branch_entry[:Author_Date] = branch_entry.fetch(:Author_Date).split('T').first
        branch_entry[:Committer_Date] = branch_entry.fetch(:Committer_Date).split('T').first
        branch_entry[:Branch_URL] = "https://gitlab.com/#{project_full_path}/-/tree/#{branch_entry.fetch(:Branch)}"
      end

      all_stale_branches_to_be_deleted.sort_by! { |entry| entry.fetch(:Committer_Date) }.reverse!

      # 5. Output branches to be deleted to CSV file for import to spreadsheet
      write_output_file(all_stale_branches_to_be_deleted, stale_cutoff_timestamp_string)

      # 6. Optional deletion of branches
      delete_branches(all_stale_branches_to_be_deleted)

      puts "Finished #{self.class.name} at #{Time.now.utc}..."
    end

    private

    def delete_branches(all_stale_branches_to_be_deleted)
      return unless ENV['CLEANUP_DELETE_IDENTIFIED_STALE_BRANCHES'] == 'true'

      puts "\nStarting Deletion...\n"

      msg = 'You must set BRANCHES_TO_KEEP_CSV to point to a file with "Branch" as the header " /
        "of the first column, which contains branch names. These branches will not be deleted.'
      raise msg unless ENV['BRANCHES_TO_KEEP_CSV']

      branches_to_keep_csv = ENV.fetch('BRANCHES_TO_KEEP_CSV')

      branches_to_keep = []
      CSV.foreach(branches_to_keep_csv, headers: true) do |row|
        branches_to_keep << row.to_hash.fetch('Branch')
      end

      all_stale_branches_to_be_deleted.each_with_index do |branch_entry, index|
        branch = branch_entry.fetch(:Branch)
        index_msg_fragment = "(#{index + 1} of #{all_stale_branches_to_be_deleted.length})"
        if branches_to_keep.include?(branch)
          msg = "NOT deleting branch #{branch} because it was in branches to keep list: '#{branches_to_keep_csv}' #{index_msg_fragment}."
          puts msg
          next
        end
        msg = "Deleting branch #{branch} #{index_msg_fragment}."
        print '[DRY RUN - NOT UPDATING] ' if dry_run?
        puts msg
        delete_branch(project_id, branch, dry_run?)
      end
    end

    def write_output_file(all_stale_branches_to_be_deleted, stale_cutoff_timestamp_string)
      output_file = "/tmp/stale_branches_for_#{project_full_path.tr('/', '-')}_to_be_deleted_before_#{stale_cutoff_timestamp_string.tr(':', '.')}.csv"
      CSV.open(output_file, "wb") do |csv|
        ordered_fields = %i[Branch Author_Name Author_Email Author_Date Committer_Name Committer_Email Committer_Date Branch_URL Has_Merge_Requests Merge_Request_URLs]
        csv << ordered_fields.map { |key| key.to_s.tr('_', ' ') } # adds header row
        all_stale_branches_to_be_deleted.each do |branch_entry|
          csv << ordered_fields.map do |field|
            branch_entry.fetch(field)
          end
        end
      end
      puts "Wrote stale branches to be deleted to CSV file #{output_file}.\n"
    end

    def filter_branches_to_be_deleted(stale_branches_by_branch_name, all_mrs)
      open_mrs = all_mrs.select { |mr| mr.fetch('state') == 'opened' }
      puts "Found #{open_mrs.length} opened MRs.\n"

      open_mr_branch_names = open_mrs.map { |mr| mr.fetch('sourceBranch') }

      stale_branches_by_branch_name.each_with_object([]) do |branch_entry, memo|
        branch_name = branch_entry[0]
        has_open_mr = open_mr_branch_names.include?(branch_name)
        next if has_open_mr

        stale_branch_to_be_deleted = branch_entry[1]

        mr_urls = all_mrs.each_with_object([]) do |mr, mr_urls_memo|
          mr_urls_memo << mr.fetch('webUrl') if mr.fetch('sourceBranch') == branch_name
        end

        stale_branch_to_be_deleted[:Merge_Request_URLs] = mr_urls.join(' | ')
        stale_branch_to_be_deleted[:Has_Merge_Requests] = mr_urls.present?

        memo << stale_branch_to_be_deleted
      end
    end

    def index_by_branch_name(branch_hashes, branch_key)
      branch_hashes.map do |branch_hash|
        [
          branch_hash.fetch(branch_key),
          branch_hash
        ]
      end.to_h
    end

    def load_branches
      repo_root_dir = ENV.fetch('CLEANUP_REPO_ROOT_DIR', __dir__)

      # Ensure we have the latest, pruned version of the remote locally, in case any branches have been deleted since the last time we fetched
      puts "Fetching latest version of #{repo_root_dir}"
      `git fetch --prune`

      for_each_ref_output = FileUtils.cd(repo_root_dir) do
        cmd = "git for-each-ref " \
              "--sort='-committerdate' " \
              "--format='%(refname)|-|%(committername)|-|%(committeremail)|-|%(committerdate:iso-strict)|-|%(authorname)|-|%(authoremail)|-|%(authordate:iso-strict)' " \
              "'refs/remotes/origin'"
        `#{cmd}`
      end

      branch_hashes = for_each_ref_output.split("\n").map do |line|
        line_array = line.split('|-|')
        field_names = %i[Branch Committer_Name Committer_Email Committer_Date Author_Name Author_Email Author_Date]
        [field_names, line_array].transpose.to_h
      end

      branch_hashes.delete_if do |branch_hash|
        %w[refs/remotes/origin/master refs/remotes/origin/HEAD].include?(branch_hash.fetch(:Branch))
      end

      branch_hashes.each do |branch_hash|
        branch_hash[:Author_Email] = branch_hash.fetch(:Author_Email).gsub(/<|>/, '')
        branch_hash[:Committer_Email] = branch_hash.fetch(:Committer_Email).gsub(/<|>/, '')
        branch_hash[:Branch] = branch_hash.fetch(:Branch).gsub('refs/remotes/origin/', '')
      end

      branch_hashes
    end

    def filter_stale_branches(all_branches, stale_cutoff_timestamp)
      stale_branches = all_branches.dup
      stale_branches.delete_if do |branch|
        date = DateTime.iso8601(branch.fetch(:Committer_Date))
        date > stale_cutoff_timestamp
      end
      stale_branches
    end
  end
end
