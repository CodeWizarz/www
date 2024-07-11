#!/usr/bin/env ruby

require 'fileutils'

# If we need to target a specific version of the Buyer Experience repository,
# we can specify a SHA reference in the BUYER_EXPERIENCE_ARTIFACTS_VERSION_REF_NAME env variable.
# If not specified, default to 'main' - which will pull the latest.
ref_name = ENV.fetch("BUYER_EXPERIENCE_ARTIFACTS_VERSION_REF_NAME", 'main')
monorepo_root = File.expand_path('..', __dir__)
FileUtils.chdir(monorepo_root)

commands = []

# Clear any existing temp directory for the buyer-experience paths
commands << "rm -rf tmp/buyer-experience"

# Create a new temp directory for the buyer-experience paths
commands << "mkdir -p tmp/buyer-experience"

# Download the artifacts from the GitLab pages job for the Buyer Experience repository
commands << "curl -S -f -L -o tmp/buyer-experience/artifacts.zip https://gitlab.com/gitlab-com/marketing/digital-experience/buyer-experience/-/jobs/artifacts/#{ref_name}/download?job=pages --retry 5"

# Unzip the artifacts folder into a new directory
commands << "unzip -q -u tmp/buyer-experience/artifacts.zip -d tmp/buyer-experience/"

# Move the files to the public folder in this pipeline, excluding some unnecessary items.
commands << "rsync -vlaP tmp/buyer-experience/public/* public/ --exclude='200.html' --exclude='.nojekyll'"

commands.each do |command|
  puts command
  (system(command) || raise) unless ENV['DRY_RUN']
end
