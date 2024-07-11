#!/usr/bin/env ruby

require_relative '../lib/cleanup/delete_stopped_environments'
Cleanup::DeleteStoppedEnvironments.new.process
