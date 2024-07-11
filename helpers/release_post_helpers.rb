require 'hashie'

module ReleasePostHelpers
  STAGE_ORDER = %w[manage plan create verify package deploy monitor secure govern systems data_stores growth].freeze

  def assemble_release_post(previous_milestone, next_milestone)
    current_article = OpenStruct.new
    current_article.data = OpenStruct.new
    current_article.data.title = 'GitLab SaaS - What\'s New'
    current_article.data.description = 'The latest features available on GitLab SaaS'
    current_article.data.previous_release_number = previous_milestone
    current_article.content = release_post_items('unreleased')

    if !current_article.content.empty?
      current_article.data.release_number = 'Preview'
    else
      current_article.data.release_number = previous_milestone
      _, current_article.content = data.release_posts.except('unreleased').max
    end
    current_article
  end

  def release_post_items(milestone)
    # Stub structure into which feature blocks will be merged
    items = Hashie::Mash.new(features: { top: [], primary: [], secondary: [] }, tertiary: [], deprecations: [], removals: [], upgrades: [])

    (data.release_posts[milestone.tr('.', '_')] || {}).each do |filename, content|
      next if filename == 'samples'

      # Assign filename to primary features (to sort by filename later)
      (content.dig('features', 'primary') || []).each { |feature| feature.merge!('filename' => filename) }

      items.deep_merge!(content) { |key, this_val, other_val| this_val + other_val }
    end

    items.features.top = items.features.top.sort_by { |item| item['name'] }
    items.features.primary = items.features.primary.sort_by { |item| item['filename'] }
    items.features.secondary = items.features.secondary.sort_by do |item|
      [
        STAGE_ORDER.find_index(item['stage']) || STAGE_ORDER.size,
        item['name']
      ]
    end
    items.tertiary = items.tertiary.sort_by { |item| item['name'] }
    items.deprecations = items.deprecations.sort_by { |item| item['feature_name'] } if items.deprecations
    items.removals = items.removals.sort_by { |item| item['feature_name'] } if items.removals

    items
  end

  def get_deprecations(milestone)
    data.release_posts['deprecations-index'][milestone]
  end

  def get_removals(milestone)
    data.release_posts['removals-index'][milestone]
  end
end
