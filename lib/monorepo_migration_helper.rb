# Helps with identifying and categorizing top-level files which are used by a monorepo sub-site:
# 1. Which files are used by other files outside the site, and need to be added to a
#    `shared_files` entry in `data/monorepo.yml`
# 2. Which files are not used by any other files outside the site, and prints out the necessary
#    git command to move them into the sub-site.
# For example: https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests/53777
#
# Notes:
# 1. This will need to be run multiple times after moving the files.  This
#    is because the moved files may have more new references in them.
# 2. This doesn't catch all usages, you will still need to manually run builds
#    for top-level and site level and check for errors.  For example, there may be
#    `partial(...)` calls in a top-level helper which is used by the site. This
#    script isn't smart enough to find transitive dependencies like this.

require 'English'
require 'psych'

class MonorepoMigrationHelper
  attr_reader :site, :files_used_in_site, :shared_files, :non_shared_files

  def process
    @site = ENV.fetch('SITE').to_sym

    @files_used_in_site = find_files_used_in_site
    pp @files_used_in_site if debug?

    @shared_files, @non_shared_files = filter_files_by_usage

    puts "\n\nFiles which already exist under site:"
    [shared_files, non_shared_files].each do |group|
      group.reject! do |f|
        match = (f =~ %r{^sites/#{site}})
        puts f if match
        match
      end
    end

    output_shared_files

    output_non_shared_files
  end

  private

  def find_files_used_in_site
    lines_for_partials = run_cmd("grep -r -e '= partial[( ].*' sites/#{site}/source")
    lines_for_partials.reject! { |line| line =~ /partial &amp/ }

    files = lines_for_partials.map do |line|
      line.match(/= partial[( ]["'](.+?)["']/)[1]
    end

    lines_for_layouts = run_cmd("grep -r -e '^layout: .*' sites/#{site}/source")
    files += lines_for_layouts.map do |line|
      file_relative_to_layout_dir = line.match(/layout: (.+)$/)[1]
      "layouts/#{file_relative_to_layout_dir}"
    end.uniq

    files.reject! { |file| file =~ /\.\./ } # ignore relative paths to parent dir
    files.select! { |file| file =~ %r{/} } # only include files with paths - ignore relative paths in current directory (no slash)
    files.map! { |file| file.gsub(%r{^/}, '') } # remove leading slashes

    files.uniq
  end

  def filter_files_by_usage
    filtered = @files_used_in_site.each_with_object({ shared: [], non_shared: [] }) do |file, memo|
      non_shared = memo.fetch(:non_shared)
      shared = memo.fetch(:shared)
      next if non_shared.length > ENV['PARTIAL_RUN_NON_SHARED'].to_i # Should be integer, allows for faster debugging
      next if shared.length > ENV['PARTIAL_RUN_SHARED'].to_i # Should be integer, allows for faster debugging

      # for partials, use full relative path
      references_to_file_under_source = run_cmd("grep -r -e '#{file}' --include '*.h*ml*' source", expect_output: false, allowed_exitstatuses: [0, 1])
      # for layouts, use only basename
      layout_line_pattern = "layout: #{Pathname.new(file).basename}"
      references_to_file_under_source += run_cmd("grep -r -e '#{layout_line_pattern}' --include '*.h*ml*' source", expect_output: false, allowed_exitstatuses: [0, 1])

      if references_to_file_under_source.empty?
        non_shared << file
      else
        shared << file
        puts "#{file} is used in the following places outside 'sites/#{site}/source':\n#{references_to_file_under_source.join("\n")}" if debug?
      end
    end
    [
      filtered.fetch(:shared).map { |f| build_real_path_with_extension(f) }.uniq.sort,
      filtered.fetch(:non_shared).map { |f| build_real_path_with_extension(f) }.uniq.sort
    ]
  end

  def build_real_path_with_extension(file)
    file_with_ext = nil
    possible_locations = []
    FileUtils.chdir(File.expand_path("..")) do
      ["sites/#{site}/source", 'source'].each do |source_dir|
        possible_locations << "#{source_dir}/#{file}*"
        dir, base = Pathname.new(file).split
        possible_locations << "#{source_dir}/#{dir}/_#{base}*"
      end
      file_with_ext = possible_locations.reduce(nil) do |memo, possible_location|
        memo ||= Dir.glob(possible_location)[0]
        memo
      end
    end
    raise "File #{file} does not exist at any of the possible locations: #{possible_locations.join(',')}" unless file_with_ext

    file_with_ext
  end

  def output_shared_files
    shared_files_without_source_prefix = shared_files.map { |f| f.gsub('source/', '') }
    monorepo_config ||= Psych.safe_load(File.read(File.expand_path('../data/monorepo.yml', __dir__)), symbolize_names: true)
    existing_shared_file_regexes_for_site = monorepo_config.fetch(site).fetch(:shared_files)
    puts "\n\nALL shared files found (individual files, no regexes):"
    puts "shared_files:"
    puts shared_files_without_source_prefix.map { |f| "  - #{f}" }.join("\n")

    matching_existing_shared_file_regexes_for_site = []
    new_shared_files = shared_files_without_source_prefix.select do |f|
      matching = existing_shared_file_regexes_for_site.select { |r| f =~ /#{r}/ }
      matching_existing_shared_file_regexes_for_site += matching
      matching_existing_shared_file_regexes_for_site.sort!.uniq!
      matching.empty? # keep only the ones with no match
    end
    unmatched_existing_shared_file_regexes = existing_shared_file_regexes_for_site - matching_existing_shared_file_regexes_for_site

    puts "\n\nNEW shared files found (excluding found files which match existing regexes):"
    if new_shared_files.empty?
      puts "NONE FOUND"
    else
      puts "shared_files:"
      puts new_shared_files.map { |f| "  - #{f}" }.join("\n")
    end

    puts "\n\nUNMATCHED existing shared_files entries with no references found (doesn't mean they aren't needed, this script doesn't find everything."
    puts "But they should have a comment in monorepo.yml indicating why they are needed):"
    if unmatched_existing_shared_file_regexes.empty?
      puts "NONE FOUND"
    else
      puts "shared_files:"
      puts unmatched_existing_shared_file_regexes.map { |f| "  - #{f}" }.join("\n")
    end
  end

  def output_non_shared_files
    puts "\n\nNon-shared files to move:"
    if non_shared_files.empty?
      puts "NONE FOUND"
    else
      move_cmds = non_shared_files.map do |f|
        dir = Pathname.new(f).dirname
        "mkdir -p sites/#{site}/#{dir} && git mv #{f} sites/#{site}/#{f}"
      end
      puts move_cmds.join("\n")
    end
  end

  def run_cmd(cmd, expect_output: true, allowed_exitstatuses: [0])
    puts "Running: #{cmd}" if debug?
    FileUtils.chdir(repo_root_dir) do
      output = `#{cmd}`
      if expect_output && output.empty?
        puts "No output from command: #{cmd}"
        exit 1
      end

      exit 1 unless allowed_exitstatuses.include?($CHILD_STATUS.exitstatus)

      return output.split("\n")
    end
  end

  def repo_root_dir
    File.expand_path('../', __dir__)
  end

  def debug?
    ENV['DEBUG'] == 'true'
  end
end
