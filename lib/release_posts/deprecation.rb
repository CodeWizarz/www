# frozen_string_literal: true

require 'gitlab'
require 'date'
require_relative '../api_retry'

module ReleasePosts
  class Deprecation
    include ApiRetry
    include Helpers

    attr_reader :path, :commit, :project_id, :link

    def initialize(path, project_id)
      @path = path
      @project_id = project_id
      @commit = get_commit
      get_file_contents
      @link = get_issue_link_or_fallback
    end

    def breaking_change
      @contents_to_yaml["breaking_change"]
    end

    def title
      @contents_to_yaml["title"]
    end

    def description
      @contents_to_yaml["body"]
    end

    def date
      DateTime.parse(@commit.committed_date).rfc822
    end

    def first_merged
      DateTime.parse(@commit.committed_date)
    end

    def announcement_milestone
      @contents_to_yaml["announcement_milestone"]
    end

    def removal_milestone
      @contents_to_yaml["removal_milestone"]
    end

    def to_s
      "- [!#{path}](#{link}) #{title}"
    end

    private

    def get_commit
      commit = nil
      api_retry do
        commit = Gitlab
          .get_file_blame(project_id, path, "master")
          .min_by { |entry| DateTime.parse(entry.commit.committed_date) }
          .commit
      end
      commit
    end

    def get_issue_link_or_fallback
      return @contents_to_yaml["issue_url"] unless @contents_to_yaml["issue_url"].nil?

      mr = get_merge_request
      mr.web_url
    end

    def get_merge_request
      mr = nil
      api_retry do
        mr = Gitlab
          .commit_merge_requests(project_id, commit.id)
          .min_by { |entry| DateTime.parse(entry.created_at) }
      end
      mr
    end

    def get_file_contents
      return @contents_to_yaml unless @contents_to_yaml.nil?

      api_retry do
        @file_contents = Gitlab.file_contents(project_id, path, "master")
      end
      contents_to_yaml(@file_contents)
    end

    def contents_to_yaml(contents)
      @contents_to_yaml ||= YAML.safe_load(contents, [Date]).first
    end
  end
end
