# frozen_string_literal: true

require 'middleman'

#
# This extension uses DESTINATION_PATH_REGEXES, which is a comma-delimited
# list of paths (regexes may be used) under source (Middleman "resource.destination_path"),
# to indicate which parts of the site should be built.
class DestinationPathRegexesFilter < Middleman::Extension
  self.resource_list_manipulator_priority = 1000

  def manipulate_resource_list(resources)
    resources.select do |resource|
      destination_path_regexes = ENV.fetch('DESTINATION_PATH_REGEXES').split(',')

      # Include the resource only if its destination_path matches any of the regexes
      destination_path_regexes.any? do |regex|
        # rubocop:disable Style/RegexpLiteral
        resource.destination_path =~ %r{#{regex}}
        # rubocop:enable Style/RegexpLiteral
      end
    end
  end
end

::Middleman::Extensions.register(:destination_path_regexes_filter, DestinationPathRegexesFilter)
