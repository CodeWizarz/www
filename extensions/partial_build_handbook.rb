# frozen_string_literal: true

require 'middleman'

#
# This middleman extension is used to speed up builds on CI
#
# We effectively do this by leveraging our CI parallelism features and split the build into
# distinct partitions.  Note that this is actively being refactored as part of the monorepo effort.
# See docs/monorepo.md for more details.
#
# If `CI_NODE_INDEX` and `CI_NODE_TOTAL` are not set, e.g. on development machines, or turning
# parallelism off, it will simply be a noop extension
class PartialBuildHandbook < Middleman::Extension
  A_THROUGH_H = "Handbook pages starting with a-h (this is approximately half of the pages as of Oct 2020)"
  ALL_OTHERS = "All other pages"

  # We must ensure that this extension runs last, so that
  # the filtering works correctly
  self.resource_list_manipulator_priority = 1000

  def_delegator :@app, :logger

  def initialize(app, options_hash = {}, &block)
    super
    @enabled = ENV['CI_NODE_INDEX'] && ENV['CI_NODE_TOTAL']

    return unless @enabled

    expected_jobs = 2

    raise "#{self.class.name}: If you want to enable parallel builds, please use exactly #{expected_jobs} parallel jobs. (CI_NODE_TOTAL='#{ENV['CI_NODE_TOTAL']}')" unless ENV['CI_NODE_TOTAL'].to_i == expected_jobs

    @partial = case ENV['CI_NODE_INDEX']
               when "1"
                 A_THROUGH_H
               when "2"
                 ALL_OTHERS
               else
                 raise "#{self.class.name}: Invalid Build Partial #{ENV['CI_NODE_INDEX']}. At the moment we only support 1 to #{expected_jobs}"
               end
  end

  def manipulate_resource_list(resources)
    unless @enabled
      logger.info "#{self.class.name}: CI environment variables were not set for a partial build; building everything"
      return resources
    end

    logger.info "#{self.class.name}: We are building the partial: #{@partial}"

    resources.select { |resource| part_of_partial?(resource) }
  end

  private

  def a_through_h?(resource)
    resource.destination_path.match(%r{handbook/[a-h]})
  end

  def all_others?(resource)
    !a_through_h?(resource)
  end

  def part_of_partial?(resource)
    case @partial
    when A_THROUGH_H
      a_through_h?(resource)
    when ALL_OTHERS
      all_others?(resource)
    else
      raise "#{self.class.name}: You are trying to build a unknown partial: #{@partial}"
    end
  end
end

::Middleman::Extensions.register(:partial_build_handbook, PartialBuildHandbook)
