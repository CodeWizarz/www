require "graphql/client"
require "graphql/client/http"
require_relative 'common_api_helper'

module Cleanup
  module GraphqlApiHelper
    include CommonApiHelper

    def all_merge_requests(project_full_path)
      all_mrs = []

      end_cursor = ''
      has_next_page = true

      while has_next_page
        if all_mrs.length > pagination_limit
          puts "Reached CLEANUP_MAX_ITEMS_TO_PROCESS limit of #{pagination_limit}, not processing any more."
          break
        end
        query_variables = {
          projectFullPath: project_full_path,
          endCursor: end_cursor
        }
        result = Client.query(AllMrsWithBranchInfo, variables: query_variables)
        all_mrs += result.data.project.merge_requests.edges.map do |edge|
          edge.node.to_h
        end
        page_info = result.data.project.merge_requests.page_info.to_h
        end_cursor = page_info.fetch('endCursor')
        puts "Retrieved #{all_mrs.length} MRs..."
        has_next_page = page_info.fetch('hasNextPage')
      end

      all_mrs
    end

    private

    def pagination_limit
      max_items = ENV['CLEANUP_MAX_ITEMS_TO_PROCESS']
      max_items ? max_items.to_i : 1_000_000
    end

    HTTP = GraphQL::Client::HTTP.new('https://gitlab.com/api/graphql') do
      def headers(_context)
        { 'Authorization': "Bearer #{ENV.fetch('PRIVATE_TOKEN')}" }
      end
    end

    Schema = GraphQL::Client.load_schema(HTTP)

    Client = GraphQL::Client.new(schema: Schema, execute: HTTP)

    AllMrsWithBranchInfo = Client.parse <<~GRAPHQL
      query($projectFullPath: ID!, $endCursor: String!) {
        project(fullPath: $projectFullPath) {
          mergeRequests(after: $endCursor) {
            edges {
              node {
                iid
                webUrl
                state
                sourceBranch
                sourceBranchExists
              }
            }
            pageInfo {
              endCursor
              hasNextPage
            }
          }
        }
      }
    GRAPHQL
  end
end
