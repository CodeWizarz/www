require 'yaml'

module Gitlab
  module Homepage
    class Feature
      def initialize(data)
        @data = data
      end

      ##
      # Accessor for serialized tier hash
      #
      def [](key)
        @data[key.to_s]
      end

      # rubocop:disable Style/MethodMissingSuper
      # rubocop:disable Style/MissingRespondToMissing

      ##
      # Middeman Data File objects compatibiltiy
      #
      def method_missing(name, *args, &block)
        @data[name.to_s]
      end

      # rubocop:enable Style/MethodMissingSuper
      # rubocop:enable Style/MissingRespondToMissing

      ##
      # Test for a feature with missing support in GitLab
      #
      def missing?
        !(gitlab_core || gitlab_starter || gitlab_premium || gitlab_ultimate)
      end

      def screenshot?
        screenshot_url != nil
      end

      def self.all!
        @features ||= YAML.load_file(File.expand_path('../data/features.yml', __dir__))
        @features['features'].map do |data|
          new(data)
        end
      end

      def self.for_category(category)
        all!.dup.keep_if { |feature| feature&.category&.include?(category.key) }
      end
    end
  end
end
