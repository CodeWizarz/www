# frozen_string_literal: true

require_relative 'stage'
require 'yaml'

module Gitlab
  module Homepage
    class Section
      LABEL_PREFIX = 'section::'

      attr_reader :key
      def initialize(key, data)
        @key = key
        @data = data
      end

      # rubocop:disable Style/MethodMissingSuper
      # rubocop:disable Style/MissingRespondToMissing

      ##
      # Middeman Data File objects compatibility
      #
      def method_missing(name, *args, &block)
        @data[name.to_s]
      end

      def label
        "#{LABEL_PREFIX}#{key}"
      end

      def stage_list
        @stage_list ||= Gitlab::Homepage::Stage.all!.select { |stage| stage.section == key }
      end

      # rubocop:enable Style/MethodMissingSuper
      # rubocop:enable Style/MissingRespondToMissing

      def self.all!
        @all ||= YAML.load_file(File.expand_path('../data/sections.yml', __dir__)).map do |key, data|
          new(key, data)
        end
      end
    end
  end
end
