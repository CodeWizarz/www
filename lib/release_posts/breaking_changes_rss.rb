# frozen_string_literal: true

require 'gitlab'
require 'nokogiri'
require_relative '../api_retry'

module ReleasePosts
  class BreakingChangesRSS
    include ApiRetry
    include Helpers

    BREAKING_CHANGES_FILE = Pathname.new(__dir__).join('..', '..', 'public', 'breaking-changes.xml').expand_path

    def initialize
      connect
    end

    def create
      processed_deprecations = deprecations

      log_info("Creating #{BREAKING_CHANGES_FILE}...")
      builder = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
        xml.rss('version' => '2.0') do
          xml.channel do
            xml.title("GitLab Breaking Changes")
            xml.link("https://docs.gitlab.com/ee/update/deprecations.html")
            xml.description("Receive notifications of upcoming changes to GitLab that may affect your team's workflow.")
            processed_deprecations.each do |change|
              xml.item do
                xml.title(change.title)
                xml.link(change.link)
                xml.description_ do
                  xml.cdata(format_description(change.description))
                end
                xml.pubDate(change.date)
              end
            end
          end
        end
      end

      BREAKING_CHANGES_FILE.dirname.mkpath
      BREAKING_CHANGES_FILE.write(builder.to_xml)
    end

    private

    def format_description(description)
      description
        .gsub /\[([^\]]+)\]\(([^)]+)\)/, '<a href="\2">\1</a>'
        .delete("\n")
    end

    def connect
      log_info("Connecting to GitLab...")

      Gitlab.configure do |config|
        config.endpoint = 'https://gitlab.com/api/v4'
        config.private_token = ENV['GITLAB_BOT_TOKEN'] || ENV['PRIVATE_TOKEN'] || ''
      end
    end

    def deprecations
      log_info("Retrieving deprecation files from API...")
      api_retry do
        deprecations = Gitlab
          .tree(GITLAB_PROJECT_ID, { path: 'data/deprecations' })
          .auto_paginate

        log_info("Loading breaking changes...")
        jobs = deprecations.map do |deprecation|
          Thread.new do
            next unless deprecation.path.end_with?("yml")

            built_deprecation = build_deprecation(deprecation.path)
            next unless built_deprecation.breaking_change

            Thread.current[:deprecations] = built_deprecation
          end
        end

        deps = jobs.each_with_object([]) do |job, all|
          job.join
          all << job[:deprecations] if job[:deprecations]
        end

        deps.sort_by(&:first_merged).reverse
      end
    end

    def build_deprecation(path)
      Deprecation.new(path, GITLAB_PROJECT_ID)
    rescue StandardError => e
      log_error("Error loading deprecation: #{path}", e)
    end
  end
end
