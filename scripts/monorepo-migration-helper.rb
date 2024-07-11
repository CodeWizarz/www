#!/usr/bin/env ruby

require_relative '../lib/monorepo_migration_helper.rb'
script_instance = MonorepoMigrationHelper.new
script_instance.process
