# frozen_string_literal: true

require 'yaml'
require 'fileutils'
require 'rest-client'

module ReleasePosts
  class Post
    include Helpers

    def initialize
      assert_release_branch!

      @release = git_current_branch.match('^release-(\d+-\d+)$').captures[0].tr('-', '_')
      @release_data_dir = File.join(git_repo_path, 'data', 'release_posts', @release)
      @release_img_dir = File.join(git_repo_path, 'source', 'images', @release)
    end

    def assemble
      # Move unreleased items to release directory
      FileUtils.mkdir_p @release_data_dir
      Dir.glob("data/release_posts/unreleased/*.{yaml,yml}") do |filepath|
        git_mv(filepath, @release_data_dir)
      end

      # Move unrelease images to the release directory
      FileUtils.mkdir_p @release_img_dir
      Dir.glob("source/images/unreleased/*.{png,jpg,jpeg,gif}") do |filepath|
        git_mv(filepath, @release_img_dir)
      end

      Dir.glob(File.join(@release_data_dir, "*.{yaml,yml}")) do |filepath|
        file = YAML.load_file(filepath)

        # Update image_urls
        content_blocks(file).each { |block| update_image_url(filepath, block) }
      end

      git_commit("Added new release post content")
    end

    private

    def assert_release_branch!
      return if git_current_branch =~ /^release-\d+-\d+$/

      fail_with "Create or checkout a release branch first!"
    end

    def content_blocks(content)
      [
        content.dig('features', 'top'),
        content.dig('features', 'primary'),
        content.dig('features', 'secondary')
      ].compact.reduce([], :|)
    end

    def update_image_url(filepath, block)
      return if block['image_url'].nil? || File.exist?(File.join('source', block['image_url']))

      guessed_image_url = block['image_url'].gsub('/unreleased/', "/#{@release}/")

      if File.exist?(File.join('source', guessed_image_url))
        replace(block['image_url'], guessed_image_url, filepath)
        git_add(filepath)
        return
      end

      puts "#{block['image_url']} is broken"
    end
  end
end
