# Checks the "edit" links in the handbook to ensure that they point to the actual location
# of the file in the repo, regardless of whether the file is located in a monorepo
# sub-site or not.
#
# NOTE: This checks the generated files in the local `public` directory, so it requires
#       that the complete site has been successfully built and generated there before
#       it is run. Use the following command to build the handbook site locally:
#       `rm -rf public && PRIVATE_TOKEN=xxx bundle exec rake build:handbook`
# NOTE: If you are trying to reproduce a CI failure locally, ensure you have set your
#       `PRIVATE_TOKEN` to a valid API key, so that all files are generated.
# NOTE: In CI, this script is only being used to test files under the `/handbook`
#       path. If you run it against a full build, it will likely fail on other
#       non-handbook files.
require 'psych'
require 'erb'

module Lint
  class CheckHandbookEditLinks
    # Links within a file (relative to the public dir) which matches any of these regexes will not be checked
    FILE_REGEXES_TO_SKIP = [
      # %r{^handbook/engineering}, # <- directory example
      # %r{^handbook/index\.html}, # <- file example...
    ].freeze
    # Links having a URL which matches any of these regexes will not be checked
    URL_REGEXES_TO_SKIP = [
      %r{(/|%2F)template\.html}, # Don't try to check proxy template URLs
    ].freeze

    def process
      monorepo_config_filename = File.expand_path('../../data/monorepo.yml', __dir__)
      monorepo_config_file = File.read(monorepo_config_filename)
      monorepo_config = Psych.load(monorepo_config_file, symbolize_names: true)

      print_initial_info(monorepo_config_filename, monorepo_config_file)

      edit_links = find_edit_links
      puts "Found #{edit_links.length} total edit links.\n\n"

      filter_out_skipped_edit_links(edit_links)
      puts "Processing #{edit_links.length} unskipped/unignored edit links.\n\n"

      annotate_edit_links_with_site(edit_links, monorepo_config)

      # Check every edit link for the proper URL
      filter_out_valid_edit_links(edit_links)

      if edit_links.empty?
        puts "All processed edit links are valid.\n\n"
        puts "Successfully finished running #{File.basename(__FILE__)} to check edit links at #{Time.now}.\n"
        puts divider_line('=')
      else
        puts "Found #{edit_links.length} invalid edit links!"
        puts divider_line
        edit_links.each do |edit_link|
          puts edit_link
        end
        puts "Found #{edit_links.length} invalid edit links!"
        puts "#{divider_line}\n\n"
        err_msg = "Error running #{File.basename(__FILE__)} to check edit links at #{Time.now}."
        puts "#{err_msg}\n\n"

        raise "Error running #{File.basename(__FILE__)} to check edit links at #{Time.now}.\n"
      end
    end

    private

    def print_initial_info(monorepo_config_filename, monorepo_config_file)
      puts divider_line('=')
      puts "Running #{File.basename(__FILE__)} to check edit links at #{Time.now}...\n"

      puts "\nConfig used for monorepo site paths, from #{monorepo_config_filename}:"
      puts divider_line
      puts monorepo_config_file
      puts "#{divider_line}\n"

      puts "\nCurrently ignored/skipped file regexes:"
      puts divider_line
      pp FILE_REGEXES_TO_SKIP
      puts "#{divider_line}\n"

      puts "\nCurrently ignored/skipped URL regexes:"
      puts divider_line
      pp URL_REGEXES_TO_SKIP
      puts "#{divider_line}\n\n"
    end

    def divider_line(char = '-')
      (char * 80).to_s
    end

    def find_edit_links
      lines = Dir.chdir(File.expand_path('../../public', __dir__)) do
        `grep -R --include \\*.html "class=external-source-link.*</a>" .`.split("\n")
      end

      lines.reject! { |line| line =~ /CONTRIBUTING.md/ }
      lines.map { |line| line.split(':', 2) }.map do |entry|
        file = entry[0].gsub(%r{^\./}, '')
        url = entry[1]
        { file: file, url: url }
      end
    end

    def annotate_edit_links_with_site(edit_links, monorepo_config)
      sites = monorepo_config
      edit_links.each do |edit_link|
        matched_site = false
        sites.each do |site, entry|
          entry.fetch(:paths).each do |path|
            file = edit_link.fetch(:file)
            site_path_prefix = /^#{path}/
            is_file_under_site = file.match?(site_path_prefix)
            if is_file_under_site
              edit_link[:site] = site
              matched_site = true
            end
          end
        end
        edit_link[:site] = :top_level unless matched_site
      end
    end

    def filter_out_skipped_edit_links(edit_links)
      edit_links.reject! do |edit_link|
        file = edit_link.fetch(:file)
        url = edit_link.fetch(:url)

        skip = false
        skip = true if FILE_REGEXES_TO_SKIP.any? do |file_regex_to_skip|
          file =~ file_regex_to_skip
        end
        skip = true if URL_REGEXES_TO_SKIP.any? do |url_regex_to_skip|
          url =~ url_regex_to_skip
        end
        skip
      end
    end

    def filter_out_valid_edit_links(edit_links)
      edit_links.reject! do |edit_link|
        site = edit_link.fetch(:site)
        file = edit_link.fetch(:file)
        url = edit_link.fetch(:url)

        valid_link?(site, file, url)
      end
    end

    def valid_link?(site, file, url)
      monorepo_site_path_fragment = site == :top_level ? '' : "sites/#{site}/"

      match = if %r{blob/master}.match?(url) # standard edit link
                url =~ %r{blob/master/#{monorepo_site_path_fragment}source/#{file}}
              elsif %r{-/ide}.match?(url) # Web IDE edit link
                url =~ %r{master/-/#{monorepo_site_path_fragment}source/#{file}}
              else
                raise "Unexpected edit link URL format found in file '#{file}': #{url}"
              end
      !match.nil?
    end
  end
end
