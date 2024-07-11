# frozen_string_literal: true

require_relative '../api_retry'

module Changelog
  class MergeRequest
    include ApiRetry

    NO_CHANGELOG_LABEL = "no changelog"

    attr_reader :iid, :title, :labels

    def initialize(iid, title, labels)
      @iid = iid
      @title = title
      @labels = labels || []
    end

    def changelog_entry?
      return false if labels.include?(NO_CHANGELOG_LABEL)

      changes_handbook?
    end

    def date
      return DateTime.new(1970, 1, 1).to_date unless merged_at.is_a?(String)

      DateTime.parse(merged_at).to_date
    end

    def merged_at
      gitlab_merge_request.merged_at
    end

    def to_s
      "- [!#{iid}](#{link}) #{title}"
    end

    def link
      "https://gitlab.com/gitlab-com/www-gitlab-com/merge_requests/#{iid}"
    end

    def author
      gitlab_merge_request.author.name
    end

    def changes
      return @changes if defined?(@changes)

      api_retry do
        @changes = Gitlab.merge_request_changes(WWW_GITLAB_COM_PROJECT_ID, iid)&.to_h
      end

      @changes
    end

    private

    def changes_handbook?
      return false unless changes&.has_key?('changes')

      changes['changes'].any? do |change|
        change['new_path'].start_with?("sites/handbook/source/handbook")
      end
    end

    def gitlab_merge_request
      api_retry do
        @gitlab_merge_request ||= Gitlab.merge_request(WWW_GITLAB_COM_PROJECT_ID, iid)
      end
      @gitlab_merge_request
    end
  end
end
