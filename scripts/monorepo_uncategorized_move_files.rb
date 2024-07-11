#!/usr/bin/env ruby

# Helper script to move files for uncategorized monorepo migration
# Moves all files under /source/ which are not used by /sites/handbook/ site
# to /sites/uncategorized/source/ site

require 'yaml'
require 'fileutils'
require 'pathname'

commands = []

monorepo_root = File.expand_path('..', __dir__)
FileUtils.chdir(monorepo_root)

##########################
# INITIAL CLEANUP AND PREP
##########################

# Remove any extraneous files from source dir before move
commands << 'git clean -dfx source'
commands << 'git clean -dfx sites/uncategorized'

# Delete and recreate uncategorized site source dir to prevent conflicts when moving
commands << 'rm -rf sites/uncategorized/source'
commands << 'mkdir -p sites/uncategorized/source'

monorepo_config = YAML.load_file('data/monorepo.yml')
uncategorized_development_paths = monorepo_config.fetch('uncategorized').fetch('development_paths').map { |r| "^#{r}" }

################################################################
# MOVE SELECTED DIRS/FILES FROM source TO sites/uncategorized/source
################################################################

source_children_to_move = FileUtils.cd('source') do
  # find all the top-level files/directories under source to move
  Dir["*"]
end

# exclude the uncategorized development paths from the move - these correspond to the files
# which still live at the top level and are handled by independent jobs in CI
source_children_to_move.reject! do |f|
  uncategorized_development_paths.any? { |dev_path_regex| f =~ /#{dev_path_regex}/ }
end

# One-off additional move exclusions
source_children_move_exclusion_regexes = [
  /^frontend/
]
source_children_to_move.reject! do |f|
  source_children_move_exclusion_regexes.any? { |exclusion_regex| f =~ /#{exclusion_regex}/ }
end

commands << "echo \"\n\nMoving children of source dir...\""

source_children_to_move.each do |f|
  # Make sure directories get a trailing slash, so they are moved as directories instead of just their contents
  path_to_move = Pathname.new(f).directory? ? "#{f}/" : f
  cmd = "git mv source/#{path_to_move} sites/uncategorized/source/"
  commands << cmd
end

# Move the blog site under the uncategorized site
commands << "echo \"\n\nMoving blog under uncategorized site...\""
commands << "git mv sites/blog/source/blog sites/uncategorized/source/"
commands << "rmdir sites/blog/source"
commands << "rmdir sites/blog"

# One-off additional move commands
commands << 'mkdir -p sites/uncategorized/source/images/'
commands << 'git mv source/images/team/ sites/uncategorized/source/images/' # team and pet images
commands << 'mkdir -p sites/uncategorized/source/.well-known/'
commands << 'git mv source/.well-known/security.txt sites/uncategorized/source/.well-known/security.txt' # security.txt

################################################
# MOVE BACK SHARED FILES NEEDED BY HANDBOOK SITE
################################################

# move BACK all the shared files which are needed by the handbook
commands << "echo \"\n\nMoving BACK handbook shared files...\""
handbook_shared_files = monorepo_config.fetch('handbook').fetch('shared_files')
# turn regexes into globs
handbook_shared_files.each_with_index do |_, i|
  handbook_shared_files[i].gsub!(%r{/\.\*$}, '') # Remove trailing wildcard after last slash
  handbook_shared_files[i].gsub!('.*', '*') # Replace '.*' with '*'
end

# exclude the handbook development paths from the move back
handbook_shared_files.reject! do |f|
  uncategorized_development_paths.any? { |dev_path_regex| f =~ /#{dev_path_regex}/ }
end

def subdir(relative_dir, file)
  pathname = Pathname.new(file)
  # Make sure directories get a trailing slash, so they are moved as directories instead of just their contents
  subdir = pathname.directory? ? "#{pathname}/" : pathname.dirname.to_s
  "#{relative_dir}#{subdir}"
end

handbook_shared_files.each do |f|
  dest = subdir('source/', f)
  commands << "mkdir -p #{dest}"
  cmd = "git mv sites/uncategorized/source/#{f} #{dest}"
  commands << cmd
end

################################################
# UPDATE CODEOWNERS FILE
################################################

text = File.read('.gitlab/CODEOWNERS')
lines = text.split("\n")
new_lines = lines.map do |line|
  skipped_line_regexes = [
    %r{^/source/direction},
    %r{^/source/frontend},
    %r{^/source/images/heroes}
  ]
  unless skipped_line_regexes.any? { |skipped_line_regex| line =~ skipped_line_regex }
    line.gsub!(%r{^/source/}, '/sites/uncategorized/source/')
  end
  line.gsub!(%r{^/sites/blog/source/blog/}, '/sites/uncategorized/source/blog/')
  line
end
new_contents = new_lines.join("\n")

File.open('.gitlab/CODEOWNERS', "w") { |file| file.puts new_contents } unless ENV['DRY_RUN']

commands << 'git add .gitlab/CODEOWNERS'

################################################
# RUN THE COMMANDS
################################################

# Run all the commands
commands.each do |cmd|
  puts cmd
  (system(cmd) || raise) unless ENV['DRY_RUN']
end
