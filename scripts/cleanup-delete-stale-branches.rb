#!/usr/bin/env ruby

require_relative '../lib/cleanup/delete_stale_branches'
Cleanup::DeleteStaleBranches.new.process
