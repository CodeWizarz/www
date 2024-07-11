# frozen_string_literal: true

require "uri"
require "gitlab"

require_relative "../../generators/releases"

class UpdateReleasesService
  CORE = "core"
  PREMIUM = "premium"
  ULTIMATE = "ultimate"

  FREE = "free"
  BRONZE = "bronze"
  SILVER = "silver"
  GOLD = "gold"

  OTHER = "other"

  # These lists define the order of the features in the release notes.
  # Anything that doesn't have a matching tier or stage gets funnelled into the "other" bucket
  TIERS = [OTHER, ULTIMATE, PREMIUM, CORE].freeze
  STAGES = %W[#{OTHER} manage plan create verify package secure release configure monitor protect modelops anti-abuse].freeze

  # Color hexes used for the feature count badges that align with
  # Pajamas colors: https://design.gitlab.com/product-foundations/colors/
  GRAY_700 = '525252'
  GREEN_500 = '108548'
  BLUE_500 = '1F75CB'

  # Constants used for generating badges using https://shields.io/
  SHIELDS_IO_URL = 'https://img.shields.io/static/v1'
  FLAT_SQUARE_STYLE = 'flat-square'
  FOR_THE_BADGE_STYLE = 'for-the-badge'

  attr_reader :project_id
  attr_reader :gitlab_client
  attr_reader :is_ee

  def initialize(project_id, api_token, is_ee)
    @project_id = project_id
    @gitlab_client = Gitlab.client(endpoint: "https://gitlab.com/api/v4", private_token: api_token)
    @is_ee = is_ee
  end

  def execute
    puts "Reading the releases posts..."
    release_posts = ReleaseList.new.release_posts
    puts "✅ Found #{release_posts.size} release posts"

    puts "Getting a list of all existing project Releases..."

    begin
      releases = gitlab_client.project_releases(project_id).auto_paginate
    rescue Gitlab::Error::Error => e
      warn("Failed to get the list of existing Releases: #{e.message}")
      abort
    end

    puts "✅ Retrieved #{releases.size} Releases from the API"

    # A map of tiers to total highlight count.
    # Used to display the number of features included in the tier across all releases.
    total_tier_highlight_counts = Hash.new(0)

    # Iterate over the release posts in reverse order (oldest to most recent)
    # so that we can compute the total feature count as we go.
    release_posts.reverse_each do |rp|
      api_object, counts = get_api_object_and_counts(rp, total_tier_highlight_counts, is_ee: is_ee)

      # Add this release's feature counts to the total counts
      counts.each { |tier, count| total_tier_highlight_counts[tier] += count }

      tag_name = version_number_to_tag_name(rp.version, is_ee: is_ee)
      existing_release = releases.find { |r| tag_name == r.tag_name }

      # The list of all milestone titles associated to this existing release
      # (or an empty array if the release has no milestones)
      existing_release_milestone_titles = (existing_release.to_h['milestones'] || []).map { |m| m['title'] }

      if !existing_release
        puts "Creating a new Release for version #{rp.version}..."

        begin
          gitlab_client.create_project_release(project_id, api_object)
        rescue Gitlab::Error::Error => e
          warn("Failed to create a new Release: #{e.message}")
          abort
        end

        puts "✅ Successfully created a new Release for tag #{tag_name}"
      elsif existing_release.description != api_object[:description] || existing_release_milestone_titles != api_object[:milestones]
        # Only trigger an update if an existing Release was found _and_ the description or milestones are different

        puts "Updating Release for version #{rp.version}..."

        begin
          gitlab_client.update_project_release(project_id, tag_name, api_object)
        rescue Gitlab::Error::Error => e
          warn("Failed to update Release with tag #{tag_name}: #{e.message}")
          abort
        end

        puts "✅ Successfully updated existing Release for tag #{tag_name}"
      else
        puts "✅ Release for version #{rp.version} is already up-to-date"
      end
    end
  end

  # Converts a release post object into a hash that
  # can be used with the Release API (https://docs.gitlab.com/ee/api/releases)
  def get_api_object_and_counts(release_post, total_tier_highlight_counts, is_ee:)
    # An array of strings that will be join()-ed together to form the release's description
    description = []

    # Defines the structure of the release post.
    # #### Top-level headings are tiers (Core, Starter, Premium, Ultimate)
    # ##### Next-level headings are stages (Manage, Plan, Create, etc.)
    # - List items are individual features ("highlights")
    tier_to_stages_map = Hash.new do |tier_to_stages_map, tier|
      tier_to_stages_map[tier] = Hash.new do |stage_to_highlights_map, stage|
        stage_to_highlights_map[stage] = []
      end
    end

    # Ignore features that don't target Core if we're working with FOSS
    filtered_highlights = release_post.highlights.filter do |highlight|
      is_ee || get_highlight_tier(highlight) == CORE
    end

    # Sort the highlights first by tier and then by stage, according
    # to the order of TIERS and STAGES at the top of this file
    sorted_highlights = filtered_highlights.sort_by.with_index do |highlight, index|
      [TIERS.index(get_highlight_tier(highlight)), STAGES.index(get_highlight_stage(highlight)), index]
    end

    # A map of tiers to highlight count.
    # Used to display the number of features added in this release for each tier.
    tier_highlight_counts = Hash.new(0)

    # Place each release post into the appropriate place in the structure
    sorted_highlights.each do |hl|
      tier = get_highlight_tier(hl)
      stage = get_highlight_stage(hl)
      tier_to_stages_map[tier][stage] << hl
      tier_highlight_counts[tier] += 1
    end

    # Update the total count with this release's counts
    # and save the result in a new Hash
    updated_total_tier_highlight_counts = {}
    tier_highlight_counts.each do |tier, count|
      updated_total_tier_highlight_counts[tier] = total_tier_highlight_counts[tier] + tier_highlight_counts[tier]
    end

    # Start the release notes with a count of all features added in this release
    # and the total number of features (across all tiers)
    release_feature_count = get_release_feature_count(tier_highlight_counts, is_ee: is_ee)
    total_feature_count = get_release_feature_count(updated_total_tier_highlight_counts, is_ee: is_ee)
    description << get_count_badges_markdown(release_feature_count, total_feature_count, is_tier_specific: false)

    # Generate the GFM by walking through the structure created above
    tier_to_stages_map.each do |tier, stages|
      description.concat(
        render_tier(
          tier,
          stages,
          release_feature_count: tier_highlight_counts[tier],
          total_feature_count: updated_total_tier_highlight_counts[tier],
          is_ee: is_ee)
      )
    end

    [
      {
        name: "GitLab #{release_post.version}",
        tag_name: version_number_to_tag_name(release_post.version, is_ee: is_ee),
        description: description.join("\n"),
        released_at: release_post.date.iso8601,
        milestones: version_number_to_milestones(release_post.version),
        assets: {
          links: [

            # Include a link to this release's blog post
            {
              name: "GitLab #{release_post.version} release post",
              url: "https://about.gitlab.com/releases/#{release_post.date.strftime('%Y/%m/%d')}/gitlab-#{release_post.version.tr('.', '-')}-released/"
            }
          ]
        }
      },
      tier_highlight_counts
    ]
  end

  # Renders a tier (Core, Starter, etc) into an array of GFM strings
  # For example:
  # #### [Ultimate](https://about.gitlab.com/pricing/ultimate/)
  def render_tier(tier, stages, release_feature_count:, total_feature_count:, is_ee:)
    description = []

    counts = get_count_badges_markdown(release_feature_count, total_feature_count, is_tier_specific: true)

    if is_ee
      # Only generate tier headings for EE, since FOSS will
      # only ever have content from one tier (Core)

      if tier == CORE
        # There is no pricing page for Core, so just list the heading in plain text

        description << "#### #{tier.humanize}\n"
        description << counts
      elsif tier != OTHER
        # For paid tiers, link to the appropriate pricing page

        description << "#### [#{tier.humanize}](https://about.gitlab.com/pricing/#{tier}/)\n"
        description << counts
      end
    end

    stages.each do |stage, highlights|
      description.concat(render_stage(stage, highlights))
    end

    description
  end

  # Renders a stage (Manage, Plan, Create, etc.) into an array of GFM strings
  # For example:
  # ##### [Release](https://about.gitlab.com/stages-devops-lifecycle/release/)
  def render_stage(stage, highlights)
    description = []

    description << "##### [#{stage.humanize}](https://about.gitlab.com/stages-devops-lifecycle/#{stage}/)\n" unless stage === OTHER

    highlights.each do |highlight|
      description.concat(render_highlight(highlight))
    end

    description << "\n"
  end

  # Renders a feature highlight into an array of GFM strings
  # For example:
  # - [Associate milestones with a release](https://docs.gitlab.com/ee/user/project/releases/#associate-milestones-with-a-release) _(SaaS only)_: `Release Orchestration`
  def render_highlight(highlight)
    list_item = highlight.link ? "[#{highlight.title}](#{highlight.link})" : highlight.title

    list_item += get_highlight_availability_tag(highlight)

    # If the highlight includes "categories", list them after
    # the link, surrounded with backticks (`)
    list_item += ": #{highlight.categories.map { |c| "<code>#{c}</code>" }.join(', ')}" unless highlight.categories.blank?

    list_item = "<details><summary>#{list_item}</summary>\n\n#{quoted_highlight_description(highlight)}\n</details>\n"

    [list_item]
  end

  # Returns the tier of a highlight as a string
  # If no matching tier is found, "other" is returned
  def get_highlight_tier(highlight)
    return CORE if highlight.tier.include?(CORE)
    return PREMIUM if highlight.tier.include?(PREMIUM)
    return ULTIMATE if highlight.tier.include?(ULTIMATE)

    OTHER
  end

  # Returns the stage of a highlight as a string
  # If no matching stage is found, "other" is returned
  def get_highlight_stage(highlight)
    return highlight.stage if STAGES.include?(highlight.stage)

    OTHER
  end

  # If the feature is only available on GitLab.com, returns " _(SaaS only)_".
  # If the feature is only available on self-managed instances, returns " _(self-managed only)_".
  # If the feature is available everywhere, returns an empty string ""
  # The logic for how these tags should be computed is described here:
  # https://about.gitlab.com/handbook/marketing/blog/release-posts/#feature-availability
  def get_highlight_availability_tag(highlight)
    return " <i>(self-managed only)</i>" if highlight.gitlab_com == false
    return " <i>(SaaS only)</i>" if highlight.tier.include?(GOLD)

    ""
  end

  # Returns markdown that will render the "release" and "total" feature counts
  # The is_tier_specific: parameter indicates whether this count is for a specific
  # tier (e.g. all of the features in Ultimate) or all tiers (e.g.
  # all of the features across all tiers).
  def get_count_badges_markdown(release_feature_count, total_feature_count, is_tier_specific:)
    # See https://shields.io/ for documentation on each query parameter
    options = {
      style: is_tier_specific ? FLAT_SQUARE_STYLE : FOR_THE_BADGE_STYLE,
      labelColor: GRAY_700
    }

    new_options = options.merge({
                                  label: 'new features',
                                  message: release_feature_count,
                                  color: GREEN_500
                                })

    total_options = options.merge({
                                    label: 'total features',
                                    message: total_feature_count,
                                    color: BLUE_500
                                  })

    release_count_title = is_tier_specific ? "New features added to this tier in this release" : "New features added in this release"
    total_count_title = is_tier_specific ? "Total features in this tier" : "Total features"

    <<~GFM
      ![#{release_feature_count} new features](#{SHIELDS_IO_URL}?#{new_options.to_query} "#{release_count_title}")
      ![#{total_feature_count} total badges](#{SHIELDS_IO_URL}?#{total_options.to_query} "#{total_count_title}")
    GFM
  end

  # Given a map of tiers to hightlight count, returns
  # the total count of the features across all tiers.
  def get_release_feature_count(tier_highlight_counts, is_ee:)
    is_ee ? tier_highlight_counts.values.sum : tier_highlight_counts[CORE]
  end

  # Converts a version number like "12.9" into a tag name like "v12.9.0-ee"
  # (or "v12.9.0" is is_ee is false)
  def version_number_to_tag_name(version_number, is_ee:)
    version_segments = Gem::Version.create(version_number).canonical_segments
    version_segments = [
      version_segments[0] || 0,
      version_segments[1] || 0,
      version_segments[2] || 0
    ]

    "v#{version_segments.join('.')}#{is_ee ? '-ee' : ''}"
  end

  # Returns an array of group milestone names that
  # should be associated to the release.
  def version_number_to_milestones(version_number)
    version_segments = Gem::Version.create(version_number).canonical_segments

    # The `gitlab-org` group only contains milestones for 13.0 and beyond
    return [] if version_segments.first < 13

    [version_number]
  end

  def quoted_highlight_description(highlight)
    highlight.description.lines.map { |line| "> #{line}" }.join
  end
end
