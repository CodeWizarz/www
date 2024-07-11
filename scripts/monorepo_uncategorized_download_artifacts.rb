#!/usr/bin/env ruby

# Helper script to download artifacts for testing uncategorized monorepo migration
# Downloads relevant artifacts from a master build and the uncategorized migration MR,
# then unzips them and modifies them for comparison.

require 'yaml'
require 'fileutils'
require 'pathname'

commands = []

monorepo_root = File.expand_path('..', __dir__)
FileUtils.chdir(monorepo_root)

##########################
# INITIAL CLEANUP AND PREP
##########################

commands << "rm -rf tmp/testing" if ENV['CLEAN']

master_sha = ENV.fetch('MASTER_SHA')
branch_sha = ENV.fetch('BRANCH_SHA')

##########################
# Download and unzip artifacts
##########################

[
  ['prod', master_sha],
  ['review', branch_sha]
].each do |env_name, sha|
  commands << "mkdir -p tmp/testing/#{env_name}"

  # partial build jobs
  (1..5).each do |n|
    commands << "curl -S -f -L -o tmp/testing/uncategorized-build-and-#{env_name}-deploy-#{n}.zip 'https://gitlab.com/gitlab-com/www-gitlab-com/-/jobs/artifacts/#{sha}/download?job=uncategorized-build-and-#{env_name}-deploy%20#{n}/5'"
    commands << "unzip -q -u tmp/testing/uncategorized-build-and-#{env_name}-deploy-#{n}.zip -d tmp/testing/#{env_name}/uncategorized-build-and-XXX-deploy-#{n}"
  end

  # proxy resource jobs
  commands << "curl -S -f -L -o tmp/testing/uncategorized-proxy-resource-build-and-#{env_name}-deploy.zip 'https://gitlab.com/gitlab-com/www-gitlab-com/-/jobs/artifacts/#{sha}/download?job=uncategorized-proxy-resource-build-and-#{env_name}-deploy'"
  commands << "unzip -q -u tmp/testing/uncategorized-proxy-resource-build-and-#{env_name}-deploy.zip -d tmp/testing/#{env_name}/uncategorized-proxy-resource-build-and-XXX-deploy"
end

################################################
# REPLACE REVIEW ENV VALUES WITH PROD ENV VALUES
################################################

commands << "find -E tmp/testing/ -type f -iregex '.*\.(html|htmloriginal|js|css|json|xml|txt)' -exec sed -i '' 's/uncategorized-monorepo-move.about.gitlab-review.app/about.gitlab.com/g' '{}' +;"
commands << "find -E tmp/testing/ -type f -iregex '.*\.(html)' -exec sed -i '' \"s#<meta content='sites/uncategorized/' property='og:monorepo_site_path_fragment'/>#<meta content='' property='og:monorepo_site_path_fragment'/>#g\" '{}' +;"
commands << "find -E tmp/testing/ -type f -iregex '.*\.(htmloriginal)' -exec sed -i '' \"s#<meta content='sites/uncategorized/' property='og:monorepo_site_path_fragment' />#<meta content='' property='og:monorepo_site_path_fragment' />#g\" '{}' +;"
commands << "find -E tmp/testing/ -type f -iregex '.*\.(html|htmloriginal)' -exec sed -i '' \"s#blob/master/sites/uncategorized/source#blob/master/source#g\" '{}' +;"
commands << "find -E tmp/testing/ -type f -iregex '.*\.(html|htmloriginal)' -exec sed -i '' \"s#master/-/sites/uncategorized/source#master/-/source#g\" '{}' +;"

################################################
# RUN THE COMMANDS
################################################

# Run all the commands
commands.each do |cmd|
  puts cmd
  (system(cmd) || raise) unless ENV['DRY_RUN']
end
