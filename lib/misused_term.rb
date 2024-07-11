require 'yaml'

module Gitlab
  module Homepage
    class MisusedTerm
      def initialize(data)
        @data = data
      end

      def id
        avoid
          .first
          .downcase
          .gsub(/[^A-Za-z0-9\-_ ]+/, '')
          .gsub(/\s+/, '_')
          .to_sym
      end

      def avoid
        Array(super)
      end

      def use_instead
        Array(super)
      end

      # rubocop:disable Style/MethodMissingSuper
      # rubocop:disable Style/MissingRespondToMissing

      ##
      # Middeman Data File objects compatibility
      #
      def method_missing(name, *args, &block)
        data[name.to_s]
      end

      # rubocop:enable Style/MethodMissingSuper
      # rubocop:enable Style/MissingRespondToMissing

      def self.all!
        @misused_terms ||= YAML.load_file(File.expand_path('../data/communication/misused_terms.yml', __dir__))
        @misused_terms.map { |data| new(data) }
      end

      def self.excluded_from_export
        all!
          .reject { |term| term.exclude_from_exports == true }
          .map(&:avoid)
          .flatten
          .map(&:strip)
          .join(', ')
      end

      private

      attr_reader :data
    end
  end
end
