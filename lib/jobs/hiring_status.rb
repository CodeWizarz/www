# frozen_string_literal: true

module Gitlab
  module Homepage
    class Jobs
      # Country Hiring Status
      #
      # Each instance represent one country, with their own metadata.
      # When building a YAML file, we expect the following keys, with their respective meaning:
      #
      # * +country+: country name
      # * +sanction+: true/false - whether the country is under sanction or not
      # * +explanation+: free text field to provide extra explanation or specify restrictions
      # * +gitlab_entity+: the name of the GitLab owned entity that is responsible for hiring / own the contract with the employee
      # * +peo_entity+: the name of the professional employment entity that is responsible for hiring / own the contract with the employee
      # * +hiring+: true/false - whether we are hiring residents of that country or not
      # * +hiring_limit+: the current hiring cap/limit for that country
      # * +employment_laws_approved+: true/false - whether we have approved country's employment laws
      # * +employment_taxes_approved+: true/false - whether we have approved country's taxation laws
      # * +corporate_taxes_approved+: true/false - whether we have approved country's corporate taxes laws
      # * +legal_system_approved+: true/false - whether we have approved country's legal system
      #
      class HiringStatus
        def initialize(data)
          @data = data
        end

        # Return whether country is under sanction
        #
        # @return [Boolean] whether the country is under sanction
        def under_sanction?
          @data.has_key?('sanction') && @data['sanction']
        end

        # Return whether we are currently hiring in the country
        #
        # @return [Boolean] whether we are currently hiring in the country
        def hiring?
          return @data['hiring'] if @data.has_key?('hiring')

          !under_sanction?
        end

        # Return current hiring lmit
        #
        # @return [Integer, String] current hiring limit, 'no limit' when false and 'N/A' when not defined
        def hiring_limit
          if !under_sanction? && @data.has_key?('hiring_limit')
            return @data['hiring_limit'] if @data['hiring_limit']

            return 'no limit'
          end

          "WIP"
        end

        # Return defined explanation
        #
        # @return [String] explanation
        def explanation
          @data['explanation'] if @data.has_key?('explanation')
        end

        ##
        # Accessor for serialized tier hash
        #
        def [](key)
          @data[key.to_s]
        end

        def self.raw_data
          @raw_data ||= YAML.load_file(File.expand_path('../../data/country_hiring_status.yml', __dir__))
        end

        # Return all country hiring statuses
        #
        # @return [Array<HiringStatus>] array of country hiring statuses
        def self.all!
          raw_data.map do |data|
            new(data)
          end
        end

        # Return all country hiring statuses for countries under sanction
        #
        # @return [Array<HiringStatus>] array of countries hiring statuses
        def self.under_sanctions
          all!.dup.keep_if(&:under_sanction?)
        end

        # Return all country hiring statuses for countries not currently hiring
        #
        # @return [Array<HiringStatus>] array of country hiring statuses
        def self.no_hiring_list
          all!.dup.delete_if(&:hiring?)
        end

        # Return all country hiring statuses for countries currently hiring
        #
        # @return [Array<HiringStatus>] array of country hiring statuses
        def self.hireables
          all!.dup.keep_if { |country| !country.under_sanction? }
        end

        # Return all country hiring statuses for countries hiring via peo entities
        #
        # @return [Array<HiringStatus>] array of country hiring statuses
        def self.with_peo_entities
          all!.dup.keep_if { |country| !country['peo_entity'].blank? }
        end

        # Return all country hiring statuses for countries hiring via gitlab entities
        #
        # @return [Array<HiringStatus>] array of country hiring statuses
        def self.with_gitlab_entities
          all!.dup.keep_if { |country| !country['gitlab_entity'].blank? }
        end
      end
    end
  end
end
