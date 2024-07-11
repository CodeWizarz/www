# frozen_string_literal: true

require_relative 'category'
require 'yaml'

module Gitlab
  module Homepage
    class Group
      LABEL_PREFIX = 'group::'

      attr_reader :key

      def initialize(key, data, stage: nil)
        @key = key
        @data = data
        @stage = stage
      end

      # rubocop:disable Style/MethodMissingSuper
      # rubocop:disable Style/MissingRespondToMissing

      def group_table
        partial('includes/product/group_table', locals: { group_display: self })
      end

      def categories
        @data['categories'] || []
      end

      def label
        @data['label'] || "#{LABEL_PREFIX}#{key.tr('_', ' ')}"
      end

      ##
      # Middeman Data File objects compatibility
      #
      def method_missing(name, *args, &block)
        @data[name.to_s]
      end

      # rubocop:enable Style/MethodMissingSuper
      # rubocop:enable Style/MissingRespondToMissing

      def self.all!
        @all ||= YAML.load_file(File.expand_path('../data/stages.yml', __dir__))['stages'].flat_map do |stage_key, stage_data|
          stage_data['groups'].map do |group_key, group_data|
            group_data['section'] = stage_data['section']
            group_data['stage'] = stage_key
            new(group_key, group_data)
          end
        end
      end
    end
  end
end
