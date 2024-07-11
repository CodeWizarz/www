# Based on: https://gitlab.com/gitlab-org/gitlab/-/blob/0dbb379dcd8edc7cbf8c2d5c1fb3905582a3bd00/ee/lib/gitlab/code_owners/file.rb
module Gitlab
  module CodeOwners
    class File
      EMAIL_REGEXP = /(?<email>([^@\s]+@[^@\s]+(?<!\W)))/
      USER_REGEXP = /^@.+/

      def initialize(content)
        @content = content
      end

      def parsed_data
        @parsed_data ||= get_parsed_data
      end

      def owners_for_path(path)
        path = "/#{path}" unless path.start_with?('/')

        matching_pattern = parsed_data.keys.reverse.detect do |pattern|
          path_matches?(pattern, path)
        end

        parsed_data[matching_pattern] || []
      end

      private

      attr_reader :content

      def get_parsed_data
        parsed = {}

        content.lines.each do |line|
          line = line.strip
          next unless line.present?
          next if line.start_with?('#', '^', '[')

          pattern, _separator, owners = line.partition(/(?<!\\)\s+/)

          pattern = normalize_pattern(pattern)

          parsed[pattern] = normalized_owners(owners)
        end

        parsed
      end

      def normalize_pattern(pattern)
        # Remove `\` when escaping `\#`
        pattern = pattern.sub(/\A\\#/, '#')
        # Replace all whitespace preceded by a \ with a regular whitespace
        pattern = pattern.gsub(/\\\s+/, ' ')

        return '/**/*' if pattern == '*'

        pattern = "/**/#{pattern}" unless pattern.start_with?('/')
        pattern = "#{pattern}**/*" if pattern.end_with?('/')

        pattern
      end

      def normalized_owners(owners)
        owners.split(/\s+/).select do |owner|
          owner.match?(EMAIL_REGEXP) || owner.match?(USER_REGEXP)
        end
      end

      def path_matches?(pattern, path)
        # `FNM_DOTMATCH` makes sure we also match files starting with a `.`
        # `FNM_PATHNAME` makes sure ** matches path separators
        flags = ::File::FNM_DOTMATCH | ::File::FNM_PATHNAME

        ::File.fnmatch?(pattern, path, flags)
      end
    end
  end
end
