require 'yaml'

module Gitlab
  module CodeOwners
    class OwnerValidator
      ALLOWED_GROUPS = %w[@timtams @gl-product-leadership].freeze

      def initialize(data, team = Gitlab::Homepage.team.members)
        @data = data
        @team_entries = team
        @errors = []
      end

      attr_reader :errors

      def valid?
        data.values.flatten.uniq.each do |owner|
          errors << missing_owner_message(owner) unless owner_exists?(owner)
        end

        errors.none?
      end

      private

      attr_reader :data, :team_entries

      def owner_exists?(owner)
        return true if owner.start_with?('@gitlab-')
        return true if ALLOWED_GROUPS.include?(owner)

        team_entries.find { |entry| entry['gitlab']&.to_s&.downcase == owner.gsub(/@/, '')&.downcase }
      end

      def missing_owner_message(owner)
        "Incorrect owner: #{owner}. Make sure that this Gitlab account name is correct. It must be present in the data/team_members entry."
      end
    end
  end
end
