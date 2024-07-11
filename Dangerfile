# frozen_string_literal: true

require_relative './lib/team/yaml'

begin
  yaml = Gitlab::Homepage::Team::Yaml.new
  yaml.verify_members!
rescue Gitlab::Homepage::Team::InconsistentTeamError => e
  failure(e.message)
end

# vim: filetype=ruby
