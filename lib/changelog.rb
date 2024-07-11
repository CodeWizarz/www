# frozen_string_literal: true

# TODO: All these requires should be moved to the files which actually use them,
#       then delete this file
require 'gitlab'
require 'date'

require_relative 'gitlab_api_helper'
require_relative 'changelog/merge_request'
require_relative 'changelog/file'
require_relative 'changelog/rss'
