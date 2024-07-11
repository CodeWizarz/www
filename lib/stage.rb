# frozen_string_literal: true

require_relative 'group'
require 'yaml'

module Gitlab
  module Homepage
    class Stage
      LABEL_PREFIX = 'devops::'

      attr_reader :key

      def initialize(key, data)
        @key = key
        @data = data
      end

      def groups
        @groups ||= @data['groups'].keys
      end

      def group_list
        @group_list ||= @data['groups'].map { |key, data| Gitlab::Homepage::Group.new(key, data, stage: self) }
      end

      def categories
        @categories ||= Category.for_stage(self)
      end

      def label
        @data['label'] || "#{LABEL_PREFIX}#{key}"
      end

      # rubocop:disable Style/MethodMissingSuper
      # rubocop:disable Style/MissingRespondToMissing

      ##
      # Middeman Data File objects compatibility
      #
      def method_missing(name, *args, &block)
        @data[name.to_s]
      end

      # rubocop:enable Style/MethodMissingSuper
      # rubocop:enable Style/MissingRespondToMissing

      def self.all!
        @stage_data ||= YAML.load_file(File.expand_path('../data/stages.yml', __dir__))
        @stage_data['stages'].map do |key, data|
          new(key, data)
        end
      end
    end
  end
end
