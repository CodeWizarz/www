#!/usr/bin/env ruby
# frozen_string_literal: true

require 'date'
require 'yaml'
require 'fileutils'

Dir['data/team_members/person/**/*.yml'].each do |path|
  next if path.count('/') < 5

  filename = File.basename(path)
  prefix = filename.chr
  directory = "data/team_members/person/#{prefix}"

  FileUtils.mkdir_p(directory)
  FileUtils.mv(path, "#{directory}/#{filename}")
end
