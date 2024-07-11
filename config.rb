if ENV['MIDDLEMAN_CONFIG_FILE_NAME']
  # Load a custom config instead of this one
  require_relative 'extensions/middleman_evaluate_configuration_monkeypatch'
  return
end

puts "\nRunning Middleman directly from the top level is no longer supported.\n" \
  "Use `rake build:*` tasks to build locally, or run a development server from a `sites/SITENAME` directory.\n" \
  "See README, doc/development.md, and doc/monorepo.md for more details.\n\n"
raise 'Aborting Middleman run from top level'
