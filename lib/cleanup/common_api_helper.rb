module Cleanup
  module CommonApiHelper
    private

    def pagination_limit
      max_items = ENV['CLEANUP_MAX_ITEMS_TO_PROCESS']
      max_items ? max_items.to_i : 1_000_000
    end
  end
end
