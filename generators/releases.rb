require 'date'
require 'hashie'
require 'yaml'

# Generates the Markdown used by the `/releases/` page based on monthly
# release blog posts in this repository
class ReleaseList
  # Don't generate for versions prior to 9.2
  #
  # 9.2 is the first relase post with YAML features
  CUTOFF = Date.new(2017, 5, 22)

  # There were 67 releases prior to that on or around the 22nd
  #
  # See https://gitlab.com/gitlab-com/www-gitlab-com/issues/5396#note_224693712
  RELEASES_BEFORE_CUTOFF = 67

  def initialize(location: '../sites/uncategorized/source/releases', data_dir_location: '../data/release_posts')
    @location = location
    @data_dir_location = data_dir_location
  end

  def count
    release_posts.count + RELEASES_BEFORE_CUTOFF
  end

  def generate(output = StringIO.new)
    release_posts.each do |post|
      output.puts "## [GitLab #{post.version}](#{post.relative_url})"
      output.puts post.date.to_time.strftime('%A, %B %e, %Y').to_s
      output.puts '{: .date}'
      output.puts

      tiers = {
        ultimate: [],
        premium:  [],
        core:     []
      }

      tiers.each_pair do |tier_name, tier_item|
        tier_name = tier_name.to_s
        output.puts "### #{tier_name.humanize}"

        stages = {
          manage: [],
          plan: [],
          create: [],
          verify: [],
          package: [],
          secure: [],
          deploy: [],
          monitor: [],
          govern: [],
          "ai-powered": [],
          modelops: []
        }

        post.highlights.each do |highlight|
          if highlight.tier.first == tier_name && highlight.stage
            begin
              stages[highlight.stage.to_sym].push(highlight)
            rescue NoMethodError
              # puts "Invalid stage: #{highlight.stage}"
            end
          end
        end

        stages.each_pair do |stage_name, stage|
          stage_name = stage_name.to_s

          if stage.length.positive?
            output.puts "<div class='stage-wrapper'>"
            output.puts "<h5>#{stage_name.humanize}</h5><ul>"

            stage.each do |highlight|
              output.puts "<li>#{highlight} "

              Array.wrap(highlight.categories).each do |category|
                output.puts "<span class='category category-#{category.delete(" ")}'>#{category.humanize}</span> "
              end

              Array.wrap(highlight.issue_url).each do |issue|
                output.puts "<span class='category'><a href='#{issue}'>Issue</a></span>"
              end

              output.puts "</li>"
            end

            output.puts "</ul></div>"
            output.puts
          end
        end

        # Do any of the stages in this tier have a highlighted feature?
        has_stages = stages.any? { |key, val| val.any? }

        # If no stage highlights, group by tier
        unless has_stages
          post.highlights.each do |highlight|
            if highlight.tier.first == tier_name
              tiers[highlight.tier.first.to_sym].push(highlight)
            end
          end

          if tier = tiers[tier_name.to_sym]
            tier.each do |highlight|
              output.puts "- #{highlight}"
            end
            output.puts
          end
        end
      end
    end

    # Return the final string if `output` supports it
    output.string if output.respond_to?(:string)
  end

  # Returns an Array of monthly release posts in descending order
  def release_posts
    root = File.expand_path(@location, __dir__)

    # find's `-regex` option is too dumb to do what we want, so use grep too
    find = %(find "#{root}" -type f -iname "*-released.html.md")
    grep = %(grep #{grep_flags} '\\d{4}-\\d{2}-22-gitlab-\\d{1,2}-\\d{1,2}-released')
    sort = %q(sort -n)

    `#{find} | #{grep} | #{sort}`
      .lines
      .map    { |path| ReleasePost.new(path, @data_dir_location) }
      .reject { |post| post.date < CUTOFF }
      .reverse
  end

  private

  def grep_flags
    # GNU supports PCRE via `-P`; for others (i.e., BSD), we want `-E`
    if `grep -V`.include?('GNU grep')
      '-P'
    else
      '-E'
    end
  end

  class ReleasePost
    attr_reader :filename, :title, :date, :version, :stage, :categories

    def initialize(filename, data_dir_location)
      @filename = filename.strip
      @data_dir_location = data_dir_location

      extract_attributes
    end

    def relative_url
      format('/releases/%<year>d/%<month>0.2d/%<day>0.2d/%<title>s', year: date.year, month: date.month, day: date.day, title: title)
    end

    # Returns an Array of "highlights"
    #
    # If a data file exists for the release post, we extract the feature list
    # from its YAML.
    #
    def highlights
      return @highlights if @highlights

      @highlights =
        if data_file?
          highlights_from_data_file
        else
          highlights_from_data_dir
        end

      @highlights
    end

    private

    class Highlight
      attr_reader :title, :link, :tier, :gitlab_com, :stage, :categories, :issue_url, :description

      def initialize(title, link = nil, tier = nil, gitlab_com = nil, stage = nil, categories = nil,
                    issue_url = nil, description = nil)
        @title = title
        @link  = link
        @tier = tier
        @gitlab_com = gitlab_com
        @stage = stage
        @categories = categories
        @issue_url = issue_url
        @description = description
      end

      def link?
        link.to_s.present?
      end

      def to_s
        if link?
          "<a href='#{link}'>#{title}</a>"
        else
          title
        end
      end
    end

    def extract_attributes
      match = filename.match(
        /
          (?<date>\d{4}-\d{2}-\d{2})
          -
          (?<title>
            gitlab-
            (?<major>\d{1,2})-(?<minor>\d{1,2})
            -released
          )
        /xi
      )

      @title   = match['title']
      @date    = Date.parse(match['date'])
      @version = "#{match['major']}.#{match['minor']}"
    end

    def data_file?
      File.exist?(data_file_path)
    end

    def data_file_path
      filename = File.basename(@filename, '.html.md').tr('-', '_')
      File.expand_path("#{@data_dir_location}/#{filename}.yml", __dir__)
    end

    def highlights_from_data_dir
      features = Hashie::Mash.new

      release_path = File.join(File.expand_path(@data_dir_location, __dir__), @version.tr('.','_'))
      Dir.glob("#{release_path}/*.yml").each do |file_path|
        item = YAML.safe_load(File.read(file_path))

        features.deep_merge!(item) { |key, this_val, other_val| this_val + other_val }
      end

      features
        .fetch('features', {})
        .values
        .flatten
        .collect do |f|
          link = f['documentation_link'] || f['performance_url']
          issue_url = f['issue_url'] || f['epic_url']
          Highlight.new(f['name'], link, f['available_in'], f['gitlab_com'], f['stage'], f['categories'], issue_url, f['description'])
        end
    end

    def highlights_from_data_file
      features = YAML.safe_load(File.read(data_file_path)).fetch('features', {})

      features
        .values
        .flatten
        .collect do |f|
          link = f['documentation_link'] || f['performance_url']
          issue_url = f['issue_url'] || f['epic_url']
          Highlight.new(f['name'], link, f['available_in'], f['gitlab_com'], f['stage'], f['categories'], issue_url, f['description'])
        end
    end
  end
end
