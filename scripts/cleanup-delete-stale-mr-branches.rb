#!/usr/bin/env ruby

require_relative '../lib/cleanup/delete_stale_mr_branches'
delete_stale_mr_branches = Cleanup::DeleteStaleMrBranches.new
delete_stale_mr_branches.process
