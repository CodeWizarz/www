# frozen_string_literal: true

require 'json'
require 'net/http'
require 'optparse'
require 'yaml'
require 'shellwords'

require_relative 'release_posts/helpers'
require_relative 'release_posts/issue'
require_relative 'release_posts/input_parser'
require_relative 'release_posts/post'
require_relative 'release_posts/post_entry'
require_relative 'release_posts/builder'
require_relative 'release_posts/deprecation'
require_relative 'release_posts/deprecations'
require_relative 'release_posts/removals'
require_relative 'release_posts/breaking_changes_rss'
require_relative 'release_posts/release'

module ReleasePosts
  def self.auto_build
    Builder.new.auto_build
  end
end
