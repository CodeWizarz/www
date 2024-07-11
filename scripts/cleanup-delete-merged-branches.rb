#!/usr/bin/env ruby

require_relative '../lib/cleanup/delete_merged_branches'
delete_merged_branches = Cleanup::DeleteMergedBranches.new
delete_merged_branches.process
