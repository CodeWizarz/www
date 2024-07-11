# frozen_string_literal: true

require 'httparty'

module Gitlab
  module Homepage
    class FastlyClient
      include HTTParty

      base_uri "https://api.fastly.com"
      debug_output $stdout if ARGV.include?('--debug')
      headers 'Fastly-Key' => ENV['FASTLY_API_KEY'], 'Content-Type' => 'application/json'

      class << self
        def patch_snippet(snippet_id, data)
          put("/service/#{service_id}/snippet/#{snippet_id}", body: data, headers: { 'Content-Type' => 'application/x-www-form-urlencoded' })
        end

        def get_dictionary_items(dictionary_id)
          get("/service/#{service_id}/dictionary/#{dictionary_id}/items")
        end

        def update_dictionary_items(dictionary_id, items)
          patch("/service/#{service_id}/dictionary/#{dictionary_id}/items", body: { items: items }.to_json)
        end

        def delete_dictionary_item(dictionary_id, item_key)
          delete("/service/#{service_id}/dictionary/#{dictionary_id}/item/#{item_key}")
        end

        def service_id
          ENV.fetch('FASTLY_SRV_ID')
        end
      end
    end
  end
end
