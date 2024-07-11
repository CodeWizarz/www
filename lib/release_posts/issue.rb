# frozen_string_literal: true

require 'base64'
require 'uri'

require_relative '../category'
require_relative '../group'
require_relative '../stage'

module ReleasePosts
  class Issue
    include Helpers

    CONTENT_REGEX = /^[#]+ (Release notes)\W*^(?<description>.*?)\s*(^[#]+ |\Z)/im
    IMAGE_REGEX = /\!\[.*?\]\((?<image>.*?)\)/im
    DOCS_PREFIX = 'https://docs.gitlab.com/'

    def initialize(issue, type_name)
      @issue = issue
      @type_name = type_name
    end

    def id
      @issue['id']
    end

    def iid
      @issue['iid']
    end

    def project_id
      @issue['project_id']
    end

    def group_id
      @issue['group_id']
    end

    def issue?
      !project_id.nil?
    end

    def issueable_type
      return 'issue' if issue?

      'epic'
    end

    def title
      @issue['title']
    end

    def description
      @issue['description']
    end

    def labels
      @issue['labels']
    end

    def milestone_id
      @issue.dig('milestone', 'iid')
    end

    def milestone_title
      @issue.dig('milestone', 'title')
    end

    def web_url
      @issue['web_url']
    end

    def epic?
      project_id.nil?
    end

    def issue_web_url
      web_url unless epic?
    end

    def epic_web_url
      web_url if epic?
    end

    def due_date
      d = @issue['due_date'] || @issue.dig('milestone', 'due_date') || '2019-04-22'
      Date.iso8601(d).strftime("%B %-d, %Y")
    end

    def documentation_url
      URI.extract(documentation_line).find { |u| u.start_with?(DOCS_PREFIX) }
    end

    def assignees
      @issue['assignees']&.map { |a| a['username'] }
    end

    def group_label
      labels.find { |label| label.start_with?(Gitlab::Homepage::Group::LABEL_PREFIX) }
    end

    def group
      return nil if group_label.nil?

      normalized = group_label.delete_prefix(Gitlab::Homepage::Group::LABEL_PREFIX).tr(' ', '_')
      Gitlab::Homepage::Group.all!.find { |g| g.key == normalized }
    end

    def stage_label
      labels.find { |label| label.start_with?(Gitlab::Homepage::Stage::LABEL_PREFIX) }
    end

    def stage
      return nil if stage_label.nil?

      normalized = stage_label.delete_prefix(Gitlab::Homepage::Stage::LABEL_PREFIX).tr(' ', '_')
      Gitlab::Homepage::Stage.all!.find { |s| s.key == normalized }
    end

    def category_labels
      labels.select { |label| label.start_with?(Gitlab::Homepage::Category::LABEL_PREFIX) }
    end

    def categories
      return nil if category_labels.nil?

      normalized = category_labels.map { |label| label.delete_prefix(Gitlab::Homepage::Category::LABEL_PREFIX).downcase }
      Gitlab::Homepage::Category.all!.filter { |category| normalized.include? category.name.downcase }
    end

    def available_in
      all_tiers = %w[core premium ultimate]

      all_tiers.select { |tier| labels.include?("GitLab #{tier.capitalize}") || labels.include?('GitLab Free') }
    end

    def release_post_label
      labels.find { |label| label.start_with?(RP_LABEL_PREFIX) }
    end

    def type_name
      return @type_name if @type_name

      type_found = TYPES.find do |type|
        type.label == release_post_label
      end

      type_found ? type_found.name : nil
    end

    def slug
      slugify(title)
    end

    def content
      content = raw_content

      # Remove the lines defining the image
      [image_url].compact.each do |u|
        content = content.each_line.reject { |line| line.include? u }.join
      end

      +"#{content.strip}\n"
    end

    # Verbatim image_url in the description
    def image_url
      return unless matches = raw_content.match(IMAGE_REGEX)

      matches[:image].to_s
    end

    def absolute_image_url
      return unless image_url

      return image_url if image_url =~ URI::DEFAULT_PARSER.make_regexp

      # Assuming it's a relative link, construct a valid URL
      namespace = web_url.split('/-/')[0]
      u = URI(namespace)
      u.path += '/-' if epic?
      u.path += image_url
      u.to_s
    end

    def image_binary
      URI.open(absolute_image_url).read
    end

    def image_base64
      Base64.strict_encode64(image_binary)
    end

    def release_post_workflow_label
      labels.find { |label| label.start_with?(RELEASE_POST_WORKFLOW_PREFIX) }
    end

    private

    def raw_content
      placeholder = +"Lorem ipsum [dolor sit amet](#link), consectetur adipisicing elit. Perferendis nisi vitae quod ipsum saepe cumque quia `veritatis`.\n"
      match = description.match(CONTENT_REGEX)

      return placeholder unless match

      match[:description]
    end

    def titleize(string)
      string.split.each(&:capitalize!).join(' ').to_s
    end

    def slugify(value)
      value.strip.gsub(/\s/, '_').gsub(/\W/, '').downcase
    end

    # Selects a line with one documentation URL, that takes up the largest
    # proportion of characters in the line.
    def documentation_line_number
      scores = raw_content.each_line.map do |l|
        doc_links = URI.extract(l).select { |u| u.start_with?(DOCS_PREFIX) }

        doc_links.length == 1 ? (doc_links.first.length.to_f / l.length) : 0
      end

      return scores.each_with_index.max[1] unless scores.max.zero? && scores.max < 0.3

      nil
    end

    def documentation_line
      placeholder = +'https://docs.gitlab.com/ee/#amazing'

      return raw_content.lines[documentation_line_number] unless documentation_line_number.nil?

      placeholder
    end
  end
end
