# Checks the structure of the monorepo, to ensure no files are created in incorrect locations
require 'psych'
require 'fileutils'
require 'colorize'

module Lint
  class MonorepoStructure
    attr_reader :monorepo_root, :sites_dir, :sites

    def run
      @monorepo_root = File.expand_path('../..', __dir__)
      @sites_dir = "#{monorepo_root}/sites"
      monorepo_config = Psych.load_file("#{monorepo_root}/data/monorepo.yml")
      @sites = monorepo_config.keys

      puts "\n=> Checking monorepo directory structure..."

      check_sites_subdirs
      check_each_site_subdirs
      check_root_source_dirs
      check_for_top_level_team_images_dir

      # See https://gitlab.com/gitlab-com/www-gitlab-com/-/blob/master/doc/monorepo.md#no-circular-dependencies-rule
      puts "\n=> Checking for invalid circular dependencies in monorepo structure..."
      check_for_root_circular_dependencies
      puts "\n=> Checking for invalid peer dependencies in monorepo structure..."
      check_for_peer_dependencies

      puts "\n=> Monorepo structure is good!"
    end

    private

    def check_sites_subdirs
      site_subdirs = FileUtils.chdir(sites_dir) do
        Dir.glob('*')
      end
      reject_ds_store!(site_subdirs)

      extra_dirs = site_subdirs - sites

      # Note: This guard clause is kind of confusing, but it's needed to keep Rubocop happy
      return if extra_dirs.empty?

      puts "Unexpected file(s) under 'sites' directory: #{extra_dirs.inspect}".red
      exit 1
    end

    def check_each_site_subdirs
      sites.each do |site|
        site_dir = "#{sites_dir}/#{site}"
        FileUtils.chdir(site_dir) do
          site_dir_sub_files = Dir.glob('*')
          reject_ds_store!(site_dir_sub_files)

          # remove expected/allowed files
          site_dir_sub_files.reject! do |f|
            [
              /config.*\.rb/, # middleman config files
              /^source$/
            ].any? { |regex| f =~ regex }
          end

          unless site_dir_sub_files.empty?
            puts "Unexpected file(s) under '#{site_dir}' directory: #{site_dir_sub_files.inspect}".red
            exit 1
          end
        end
      end
    end

    def check_root_source_dirs
      root_source_dir = "#{monorepo_root}/source"

      FileUtils.chdir(root_source_dir) do
        root_source_dir_files = Dir.glob('*')
        reject_ds_store!(root_source_dir_files)

        # exclude expected/allowed files in root source dir
        root_source_dir_files.reject! do |dir|
          %w[
            direction
            frontend
            ico
            images
            includes
            javascripts
            layouts
            stylesheets
            .gitattributes
          ].any? { |allowed| dir == allowed }
        end

        unless root_source_dir_files.empty?
          puts "Unexpected dir(s) under '#{root_source_dir}': #{root_source_dir_files.inspect}.".red
          puts "Please add them under the source dir of one of the sites instead.  For example: #{sites.map { |s| "sites/#{s}/source" }.join(', ')}".red
          exit 1
        end
      end
    end

    def check_for_root_circular_dependencies
      top_level_references_to_sites = []

      FileUtils.chdir(monorepo_root) do
        %w[source helpers].each do |top_level_dir|
          sites.each do |site|
            top_level_references_to_sites += find_site_references(top_level_dir, site)
            top_level_references_to_sites.reject! { |line| line =~ %r{source/#{site}/README} } # ignore README files telling people to use sub-site
            top_level_references_to_sites.reject! { |line| line =~ %r{helpers/job_families_helpers.rb} } # ignore reference to sites/uncategorized in this helper
            top_level_references_to_sites.reject! { |line| line =~ %r{https://gitlab.com/-/ide/project/gitlab-com/www-gitlab-com/edit} } # ignore WEBIDE buttons on footer
            top_level_references_to_sites.reject! { |line| line =~ %r{https://gitlab.com/gitlab-com/www-gitlab-com/-/blob} } # ignore View Page Source buttons on footer
          end
        end
      end

      # Note: This guard clause is kind of confusing, but it's needed to keep Rubocop happy
      return if top_level_references_to_sites.empty?

      puts "Invalid circular reference(s) to site(s) found from top level:".red
      puts top_level_references_to_sites.join("\n").red
      exit 1
    end

    def check_for_peer_dependencies
      peer_references_to_other_sites = []

      FileUtils.chdir(monorepo_root) do
        sites.each do |site|
          other_sites = sites - [site]
          other_sites.each do |other_site|
            puts "Checking '#{site}' from '#{other_site}'"
            peer_references_to_other_sites += find_site_references("sites/#{site}/source", other_site)
          end
        end
      end

      # exclude expected/allowed files with valid documentation (not partial or link) references to `sites/site/`
      peer_references_to_other_sites.reject! do |reference|
        [
          %r{<a.*href.*sites/}, # Exclude anchor tags with href attributes referring to `sites/`
          %r{`/?sites/}, # Exclude markdown inline code blocks referring to `sites/...` (with optional leading slash)
          %r{https://gitlab.com/gitlab-com/www-gitlab-com/(blob|-/blob|tree|-/tree|-/raw|commits|-/commits)/master/sites}, # Exclude full URLs referring to  `.../sites`
          %r{builds/gitlab-com/www-gitlab-com/sites}, # Exclude references to build job output paths within CI builds
          %r{find . sites/}, # Exclude a `find` command reference in the docs
          %r{https://handbook.gitlab.com/*}, # Exclude links to the new handbook site
          %r{https://gitlab.com/gitlab-com/content-sites/*} # Exclude links to the new handbook repo
        ].any? { |regex| reference =~ regex }
      end

      # Note: This guard clause is kind of confusing, but it's needed to keep Rubocop happy
      return if peer_references_to_other_sites.empty?

      puts "Invalid peer reference(s) between site(s) found (if this is a valid reference to a file in the repo and not a partial or link, add a matching regex for it to the list in #check_for_peer_dependencies in #{self.class.name}).".red
      puts peer_references_to_other_sites.join("\n").red
      exit 1
    end

    def find_site_references(dir_to_check, site)
      `grep -r -e 'sites/#{site}' #{dir_to_check}`.split("\n")
    end

    # Remove '.DS_Store' (created by Finder on MacOS) from an array of file basenames
    def reject_ds_store!(files)
      files.reject! { |d| d =~ /.DS_Store/ }
    end

    def check_for_top_level_team_images_dir
      relative_team_dir = 'source/images/team'
      images_team_dir_exists = File.exist?("#{monorepo_root}/#{relative_team_dir}")

      # Note: This guard clause is kind of confusing, but it's needed to keep Rubocop happy
      return unless images_team_dir_exists

      puts "Do not commit team images under '/#{relative_team_dir}'. They should instead go under 'sites/uncategorized/#{relative_team_dir}'".red
      exit 1
    end
  end
end
