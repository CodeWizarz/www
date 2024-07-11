#!/usr/bin/env ruby

require_relative '../lib/cleanup/process_stale_mrs'
process_stale_mrs = Cleanup::ProcessStaleMrs.new
process_stale_mrs.process
