# frozen_string_literal: true

module ReleasePosts
  class InputParser
    extend Helpers

    TYPES_OFFSET = 1
    INVALID_TYPE = -1

    Options = Struct.new(
      :author,
      :branch,
      :dry_run,
      :force,
      :issue_url,
      :local,
      :target_project_id,
      :type,
      :verbose
    )

    class << self
      def parse(argv)
        options = Options.new

        parser = OptionParser.new do |opts|
          opts.banner = "Usage: bin/release-post-item [options] [issue url]\n\n"\
            "Create release post items from GitLab issues and epics.\n\n"\
            "Examples\n========\n\n"\
            "- Create a merge request with a release post item from the issue URL:\n"\
            "    PRIVATE_TOKEN=<token> bin/release-post-item --no-local <issue url>\n\n"\
            "- Create merge requests for all issues with ~\"release post item::*\" labels:\n"\
            "    GITLAB_BOT_TOKEN=<token> bin/release-post-item --no-local\n\n"\
            "    When <issue url> is not specified, the script will search the `gitlab-org`\n"\
            "    group for issues with release post item labels: ~\"release post item::top\",\n"\
            "    ~\"release post item::primary\", ~\"release post item::secondary\".\n\n"\
            "Environment Variables\n=====================\n\n"\
            "    - PRIVATE_TOKEN                  Token for API write operations\n"\
            "      GITLAB_BOT_TOKEN\n\n"\
            "Arguments\n=========\n\n"

          opts.on('-f', '--force', 'Overwrite an existing entry') do |value|
            options.force = value
          end

          opts.on('--[no-]dry-run', "Don't actually write anything, just print") do |value|
            options.dry_run = value
          end

          opts.on('-t', '--type [string]', String, "Override the category detected from th #{RP_LABEL_PREFIX} label. Valid options are: #{TYPES.map(&:name).join(', ')}") do |value|
            options.type = parse_type(value)
          end

          opts.on('--[no-]local', "Local mode requires a feature branch. API mode (--no-local) uses the GitLab API to create a merge request. An API token must be set for write operations to succeed using the API.") do |value|
            options.local = value
          end

          opts.on('-b', '--branch [string]', String, "Branch name") do |value|
            options.branch = value
          end

          opts.on('-p', '--project [string]', String, "Project ID") do |value|
            options.target_project_id = value
          end

          opts.on('-v', '--verbose', 'Verbose output') do |value|
            options.verbose = value
          end

          opts.on('-h', '--help', 'Print help message') do
            $stdout.puts opts
            raise Done
          end
        end

        parser.parse!(argv)

        # Issue URL is everything that remians
        options.issue_url = argv.join(' ').strip.squeeze(' ').tr("\r\n", '')

        options
      end

      def read_type
        read_type_message

        type = TYPES[$stdin.gets.to_i - TYPES_OFFSET]
        assert_valid_type!(type)

        type.name
      end

      private

      def parse_type(name)
        type_found = TYPES.find do |type|
          type.name == name
        end
        type_found ? type_found.name : INVALID_TYPE
      end

      def read_type_message
        $stdout.puts "\n>> Please specify the index for the category of release post item:"
        TYPES.each_with_index do |type, index|
          $stdout.puts "#{index + TYPES_OFFSET}. #{type.description}"
        end
        $stdout.print "\n?> "
      end

      def assert_valid_type!(type)
        return if type

        raise Abort, "Invalid category index, please select an index between 1 and #{TYPES.length}"
      end
    end
  end
end
