#!/usr/bin/env ruby
require 'csv'

data_files = `git ls-files ./data`.split("\n")
marketing_files = `git ls-files ./sites/uncategorized`.split("\n")
files = data_files.append(marketing_files)

file_path = "tmp/#{Time.now.getutc.to_i}-most-recent-commits.csv"

CSV.open(file_path, "w") do |csv|
  csv << %w[file commit_date]
  files.each do |file|
    commit_date = `git log -1 --format=%cd --date=short #{file}`.delete("\n")
    csv << %W[#{file} #{commit_date}]
  end
end

puts "Most recent commits CSV written to #{file_path}"
