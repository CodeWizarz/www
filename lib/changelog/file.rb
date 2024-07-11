# frozen_string_literal: true

require_relative '../api_retry'

module Changelog
  class File
    include ApiRetry

    def self.create(path)
      new(path).write!
    end

    def initialize(path)
      @path = path
    end

    def write!
      content = <<~PREAMBLE
        ---
        layout: markdown_page
        title: Handbook Changelog
        ---

      PREAMBLE

      content += merge_requests.group_by(&:date).map do |date, mrs|
        mrs.unshift("### #{date}").map(&:to_s).join("\n")
      end.join("\n\n")

      puts "Writing file to #{@path}"
      ::File.write(@path, content)
    end

    private

    # Set sentinel date to rolling 1 month window
    DATE_SENTINEL = DateTime.now << 1

    # This is a really expensive API call, as it will request all merge requests
    # that got created after the sentinel date
    def merge_requests
      puts "Retrieving MRs from API..."
      api_retry do
        # rubocop:disable Style/MultilineBlockChain
        Gitlab
          .merge_requests(project_id, state: 'merged', created_after: DATE_SENTINEL.to_date.to_s)
          .auto_paginate
          .map do |mr|
          puts "Reading MR #{mr.iid}"
          MergeRequest.new(mr.iid, mr.title, mr.labels)
        end.select do |mr|
          puts "Checking if MR #{mr.iid} has changelog entry..."
          mr.changelog_entry?
        end
        # rubocop:enable Style/MultilineBlockChain
      end
    end

    def project_id
      WWW_GITLAB_COM_PROJECT_ID
    end
  end
end
