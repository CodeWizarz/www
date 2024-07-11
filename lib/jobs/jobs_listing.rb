# frozen_string_literal: true

require 'greenhouse_io'
require 'lib/gitlab/file_cache'

module Gitlab
  module Homepage
    class Jobs
      class JobsListing
        include Gitlab::FileCache

        set_cache_store 'jobs_listing'

        def jobs
          jobs_data.fetch(:jobs, [])
        end

        def jobs_listing
          cached('jobs_listing') do
            jobs_listings_data
          end
        end

        def list_data
          @list_data ||= departments_data[:departments].inject([]) do |result, department|
            result << { id: department[:id], name: department[:name], parent_id: department[:parent_id], child_ids: department[:child_ids], jobs: department[:jobs] }
          end
        end

        private

        def greenhouse
          @greenhouse ||= begin
            setup!

            GreenhouseIo::JobBoard.new
          end
        end

        def setup!
          # Greenhouse configuration
          GreenhouseIo.configure do |config|
            config.symbolize_keys = true
            config.organization = 'Gitlab'
          end
        end

        def jobs_data
          @jobs_data ||= greenhouse.jobs(content: 'true')
        end

        def departments_data
          @departments_data ||= greenhouse.departments
        end

        def jobs_listings_data
          @jobs_listings_data ||= departments_data[:departments].inject([]) do |result, department|
            # next unless department[:child_ids].empty?
            jobs = []
            department[:child_ids].each do |team|
              team_data = greenhouse.department(team)
              jobs << team_data.slice(:id, :name, :jobs)
            end

            # Remove duplicate job postings based on job title
            jobs.each do |job|
              job[:jobs].uniq! { |j| j[:title] } if job[:jobs].any?
            end

            result << { id: department[:id], name: department[:name], jobs: jobs }
          end
        end
      end
    end
  end
end
