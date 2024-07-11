# This extension allows for easy debugging by building only specified paths when building,
# so you don't have to wait for the entire build to happen.
#
# Define a path regex to to debug, and it will be the only one built.  For example:
# MIDDLEMAN_DEBUG_RESOURCE_REGEX='^handbook/product/categories/plan/index.html'

# rubocop:disable Style/RegexpLiteral
class OnlyDebuggedResources < Middleman::Extension
  self.resource_list_manipulator_priority = 1000

  def manipulate_resource_list(resources)
    resources.select do |resource|
      debugged_destination_path_regexes = [
        %r{#{ENV['MIDDLEMAN_DEBUG_RESOURCE_REGEX']}},
        # You can manually add additional path regexes to debug too, for example
        # %r{^handbook/product/categories/plan/index.html},
      ]
      debugged_destination_path_regexes.any? { |regex| resource.destination_path =~ regex }
    end
  end
end
# rubocop:enable Style/RegexpLiteral
