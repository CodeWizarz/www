require_relative 'rest_api_helper'
require 'gitlab'
require_relative '../gitlab_api_helper'

module Cleanup
  class ProcessStaleMrs
    include Cleanup::RestApiHelper
    include Cleanup::Shared

    def process
      puts "Starting #{self.class.name} at #{Time.now.utc}..."
      puts "THIS IS A DRY RUN" if dry_run?
      puts "Processing Merge Requests for project #{project_id} older than #{stale_mr_days} days in state 'opened'...\n\n"

      stale_mrs = stale_merge_requests(project_id, stale_mr_days)

      # log out MRs which will be processed
      puts "\n"
      total_stale_mrs = stale_mrs.length
      puts "Found #{total_stale_mrs} Merge Requests to process:"
      pp stale_mrs
      puts "\n"

      puts "Processing #{total_stale_mrs} Merge Requests to ensure they are all updated with the note and '#{label_title}' label...\n\n"

      added_count = 0
      previously_added_count = 0
      stale_mrs.each_with_index do |stale_mr, index|
        mr_iid = stale_mr.fetch(:iid)

        existing_labels = stale_mr.fetch(:labels)
        if existing_labels.include?(label_title)
          previously_added_count += 1
          puts "Skipping updating of MR #{mr_iid} which already has the '#{label_title}' label."
          next
        end

        msg = "Updating MR #{mr_iid} to add the note and '#{label_title}' label (#{index + 1} of #{total_stale_mrs})."
        print '[DRY RUN - NOT UPDATING] ' if dry_run?
        puts msg

        add_note_to_merge_request(project_id, mr_iid, note_body, dry_run?)
        add_label_to_merge_request(project_id, mr_iid, existing_labels, label_title, dry_run?)

        added_count += 1
      end

      puts "\nProcessed #{total_stale_mrs} total Merge Requests older than #{stale_mr_days} days in state 'opened' at #{Time.now.utc}.\n"
      puts "Updated #{added_count} MRs to add the note and label."
      puts "Skipped #{previously_added_count} MRs which had already previously had the note and label added"
    end

    private

    def stale_mr_days
      stale_mr_days = ENV['CLEANUP_STALE_MR_DAYS']
      stale_mr_days ? stale_mr_days.to_i : 30
    end

    def note_body
      mr_labels_url = "https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests?scope=all&label_name[]=stale%20-%20to%20be%20closed"
      <<~NOTE_BODY
        This Merge Request has not been updated in over 30 days, and has been labeled ~"stale - to be closed" ([see entire list](#{mr_labels_url})). In 7 more days, it will be closed, and its branch will be deleted.

        **To keep this Merge Request open and prevent its branch from being deleted, remove the ~"stale - to be closed" label within 7 days**.

        The branches have been archived in the [`www-gitlab-com-archive-20200410-pre-cleanup`](https://gitlab.com/gitlab-com/www-gitlab-com-archive-20200410-pre-cleanup) project prior to deletion.

        **If you want to access the branch after it has been deleted, do the following**:
        1. Go to the [`www-gitlab-com-archive-20200410-pre-cleanup`](https://gitlab.com/gitlab-com/www-gitlab-com-archive-20200410-pre-cleanup) project
        1. [Clone the repository](https://docs.gitlab.com/ee/gitlab-basics/start-using-git.html#clone-a-repository) and check out the branch locally.  You have two options here:
            * Clone it to a new repo, if you just want to access commits on the branch locally, or
            * Add it as a remote to an existing clone of the `www-gitlab-com` repo, if you want to re-push the branch to recreate it there.
      NOTE_BODY
    end
  end
end
