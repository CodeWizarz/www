#!/usr/bin/env ruby

require_relative '../lib/lint/check_handbook_edit_links'
script_instance = Lint::CheckHandbookEditLinks.new
script_instance.process
