# frozen_string_literal: true

require_relative 'fastly_client'
require 'yaml'
require 'set'

module Gitlab
  module Homepage
    class Redirect
      DEFNINTIONS_FILE_PATH = 'data/redirects.yml'
      URI_VALIDATION_REGEXP = /^\S*$/
      COMP_OPS = %w[= ^~ ~].freeze

      attr_reader :sources, :target, :comp_op

      def self.from_file(path)
        data = YAML.load_file(path)

        raise ArgumentError, 'invalid or empty YAML file' unless data.is_a?(Array)

        data.map do |entry|
          redirect = new(entry['sources'], entry['target'], entry['comp_op'])
          yield(redirect) if block_given?
        end
      end

      def self.from_definitions_file(&block)
        from_file(DEFNINTIONS_FILE_PATH, &block)
      end

      def self.validate!(path)
        sources = Set.new
        targets = Set.new

        from_file(path) do |redirect|
          redirect.validate!

          redirect.sources.each do |source|
            raise "repeated source: #{source}" unless sources.add?(source)
          end

          target = redirect.target
          raise "repeated target: #{target}" unless targets.add?(target)
        end

        sources.each do |source|
          # Note: Since we don't allow sources to be targets, this check also
          # ensures there are no redirection loops.
          raise "#{source} can't be a source and a target" if targets.include?(source)
        end
      end

      def self.validate_definitions_file!
        validate!(DEFNINTIONS_FILE_PATH)
      end

      def initialize(sources, target, comp_op)
        raise ArgumentError, 'no sources' if sources.nil? || sources.empty?
        raise ArgumentError, 'no target' if target.nil?
        raise ArgumentError, 'no comparison operator' if comp_op.nil?
        raise ArgumentError, 'invalid comparison operator' unless COMP_OPS.include?(comp_op)

        @sources = Array(sources)
        @target = target
        @comp_op = comp_op
      end

      def validate!
        (sources + [target]).each do |uri|
          raise "invalid uri '#{uri}'" unless uri =~ URI_VALIDATION_REGEXP
        end

        raise "#{target} can't be source and a target" if sources.include?(target)
      end

      def self.fastly_snippet_patch(snippet_id, data)
        response = Gitlab::Homepage::FastlyClient.patch_snippet(snippet_id, data)

        if response.success?
          puts "Successfully updated a snippet."
        else
          puts "HTTP request to update a snippet failed with the status code: #{response.code}"
          puts response.parsed_response['detail']
          exit 1
        end
      end

      def self.fastly_update_items(dictionary_id, items)
        # There is a 1000 elements limit for dictionary API
        # https://docs.fastly.com/en/guides/resource-limits#vcl-and-configuration-limits
        dictionary_items_limit = 1000

        items.each_slice(dictionary_items_limit) do |items_batch|
          response = Gitlab::Homepage::FastlyClient.update_dictionary_items(dictionary_id, items_batch)
          if response.success?
            puts "Successfully updated a dictionary items batch."
          else
            puts "Failed to update dictionary! Status code: #{response.code}"
            puts "Response: #{response}"
            exit 1
          end
        end
      end
    end
  end
end
