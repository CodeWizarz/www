require_relative 'rest_api_helper'
require_relative 'shared'
require 'fileutils'
require 'gitlab'
require 'time'
require 'colorize'
require_relative '../gitlab_api_helper'
require_relative '../api_retry'

module Cleanup
  class DeleteStoppedEnvironments
    include Cleanup::RestApiHelper
    include Cleanup::Shared
    include ApiRetry

    def process
      puts "Starting #{self.class.name} at #{Time.now.utc}..."
      puts "THIS IS A DRY RUN" if dry_run?
      puts "Finding stopped environments for project #{project_id}...\n\n"

      stopped_environment_hashes = stopped_environments(project_id)
      total = stopped_environment_hashes.length

      puts "Deleting the following stopped environments:\n"
      pp stopped_environment_hashes

      stopped_environment_hashes.each_with_index do |stopped_environment_hash, index|
        environment_id = stopped_environment_hash[:id]
        puts "Deleting environment #{environment_id}, name: #{stopped_environment_hash[:name]} (#{index + 1} of #{total})"

        begin
          api_retry do
            delete_environment(project_id, environment_id, dry_run?)
          end
        rescue Gitlab::Error::Error => e
          puts "!!! Error deleting environment #{environment_id} (#{stopped_environment_hash[:name]}): #{e.inspect}".red
        end
      end

      puts "Finished #{self.class.name} at #{Time.now.utc}..."
    end
  end
end
