require 'active_support/core_ext/numeric/time'
require_relative '../gitlab_api_helper'
require_relative 'common_api_helper'

module Cleanup
  module RestApiHelper
    include CommonApiHelper

    def stale_merge_requests(project_id, stale_mr_days)
      mr_hashes = []
      stale_at_date = stale_mr_days.days.ago.utc
      stale_at_date_api_option = stale_at_date.iso8601
      page_size = 20
      api_options = {
        per_page: page_size,
        # view: 'simple', # This makes it MUCH, MUCH faster
        state: 'opened',
        updated_before: stale_at_date_api_option,
        order_by: 'updated_at',
        sort: 'desc'
      }

      paginated_mrs = Gitlab.merge_requests(project_id, api_options)
      paginated_mrs.paginate_with_limit(pagination_limit) do |item|
        item_hash = item.to_hash

        mr_hash = {
          id: item_hash.fetch('id'),
          iid: item_hash.fetch('iid'),
          state: item_hash.fetch('state'),
          updated_at: Time.parse(item.to_hash.fetch('updated_at')),
          labels: item_hash.fetch('labels'),
          source_branch: item_hash.fetch('source_branch')
        }

        mr_hashes << mr_hash

        puts "Found #{mr_hashes.length} Merge Requests older than #{stale_mr_days} days in state 'opened'..." if (mr_hashes.length % page_size).zero?
      end

      mr_hashes
    end

    def stale_labeled_merge_requests(project_id, label_title)
      mr_hashes = []
      page_size = 20
      api_options = {
        per_page: page_size,
        # view: 'simple', # This makes it MUCH, MUCH faster
        state: 'opened',
        labels: label_title,
        order_by: 'updated_at',
        sort: 'desc'
      }

      paginated_mrs = Gitlab.merge_requests(project_id, api_options)
      paginated_mrs.paginate_with_limit(pagination_limit) do |item|
        item_hash = item.to_hash

        mr_hash = {
          id: item_hash.fetch('id'),
          iid: item_hash.fetch('iid'),
          state: item_hash.fetch('state'),
          updated_at: Time.parse(item.to_hash.fetch('updated_at')),
          labels: item_hash.fetch('labels'),
          source_branch: item_hash.fetch('source_branch'),
          source_project_id: item_hash.fetch('source_project_id')
        }

        source_project_id = mr_hash.fetch(:source_project_id).to_i

        begin
          Gitlab.branch(source_project_id, mr_hash.fetch(:source_branch))
        rescue Gitlab::Error::NotFound
          mr_hash[:branch_location] = :missing
        end

        if mr_hash[:branch_location] != :missing
          mr_hash[:branch_location] =
            if source_project_id == project_id
              :current_project
            else
              :fork
            end
        end

        mr_hashes << mr_hash

        puts "Found #{mr_hashes.length} Merge Requests in 'opened' state with label '#{label_title}'..." if (mr_hashes.length % page_size).zero?
      end

      mr_hashes
    end

    def delete_branch(project_id, branch_name, dry_run)
      Gitlab.delete_branch(project_id, branch_name) unless dry_run
    end

    def close_merge_request(project_id, mr_iid, dry_run)
      if dry_run
        # Still do another actual request to test rate limiting with real requests against real data
        Gitlab.merge_request(project_id, mr_iid)
      else
        Gitlab.update_merge_request(project_id, mr_iid, { state_event: 'close' })
      end
    end

    def add_note_to_merge_request(project_id, mr_iid, note_body, dry_run)
      if dry_run
        # Still do another actual request to test rate limiting with real requests against real data
        Gitlab.merge_request(project_id, mr_iid)
      else
        Gitlab.create_merge_request_note(project_id, mr_iid, note_body)
      end
    end

    def add_label_to_merge_request(project_id, mr_iid, existing_labels, label_title, dry_run)
      if dry_run
        # Still do another actual request to test rate limiting with real requests against real data
        Gitlab.merge_request(project_id, mr_iid)
      else
        Gitlab.update_merge_request(project_id, mr_iid, { labels: existing_labels << label_title })
      end
    end

    def stopped_environments(project_id)
      env_hashes = []
      page_size = 100
      api_options = {
        per_page: page_size,
        states: 'stopped'
      }

      paginated_environments = Gitlab.environments(project_id, api_options)
      # This seems to fail after a while if the page size is low (like 20) instead of 100
      paginated_environments.paginate_with_limit(pagination_limit) do |environment|
        item_hash = environment.to_hash

        env_hash = {
          id: item_hash.fetch('id'),
          name: item_hash.fetch('name')
        }

        env_hashes << env_hash if item_hash.fetch('state') == 'stopped'

        puts "Found #{env_hashes.length} Environments in state 'stopped'..." if (env_hashes.length % page_size).zero?
      end

      env_hashes
    end

    def delete_environment(project_id, environment_id, dry_run)
      Gitlab.delete_environment(project_id, environment_id) unless dry_run
    end
  end
end
