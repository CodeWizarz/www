require 'middleman-core'

#-----------------------------------------------------------
# Support for a monorepo-style multi-site repo, where there
# are multiple `sites/sitename` directories, each with their
# own dedicated middleman build.
#-----------------------------------------------------------

class MonorepoExtension < Middleman::Extension
  # We must ensure that this extension runs after the FileWatcher extension, because it relies on it
  self.resource_list_manipulator_priority = 51

  option :site, nil, 'Key for monorepo sub-site from data/monorepo.yml'
  attr_reader :site, :environment

  def initialize(app, options_hash = {}, &block)
    super

    @environment = app.config[:environment]

    app.config[:layout] = 'layout' # For some reason this has to be made explicit in the sub-site build for pages with no frontmatter, even though it's the default
    app.config[:build_dir] = "#{monorepo_root}/public"

    @site = options.site.to_sym
    start_watching(site)
  end

  def manipulate_resource_list(resources)
    resources.select do |resource|
      # Get site paths from '/data/monorepo.yml' config file and turn into regexes anchored to beginning of line
      # NOTE: we have to read the YAML file ourselves, we can't rely on @app.data.  See https://github.com/middleman/middleman/issues/1810
      monorepo_site_path_regexes = monorepo_config.fetch(site).fetch(:paths).map { |path| /^#{path}/ }

      if environment == :development
        monorepo_site_path_regexes += monorepo_config.fetch(site).fetch(:development_paths).map { |path| /^#{path}/ }
      end

      # Include the resource only if its destination_path matches any of the regexes
      monorepo_site_path_regexes.any? do |regex|
        resource.destination_path =~ regex
      end
    end
  end

  private

  #-----------------------------------------------------------------------------
  # Make top-level shared files used by this site available to this site's Middleman build
  #-----------------------------------------------------------------------------
  def start_watching(site)
    # Map shared files to regexes to be used in files.watch
    watched_files = monorepo_config.fetch(site).fetch(:shared_files).map { |f| /#{f}/ }

    if environment == :development
      watched_files += monorepo_config.fetch(site).fetch(:development_paths).map { |path| %r{^#{path}/} }
    end

    # IMPORTANT NOTE: The `only` entry in a `files.watch` CANNOT be an empty array! This leads to unexpected behavior
    #                 and failure to find files in other similar paths which do exist.
    # rubocop:disable Style/GuardClause
    unless watched_files.empty?
      app.files.watch(
        :source,
        path: "#{monorepo_root}/source",
        only: watched_files
      )
    end
    # rubocop:enable Style/GuardClause
  end

  def monorepo_root
    # TODO: Make this configurable, with a default which is relative based on the current site config settings/location.
    @monorepo_root ||= File.expand_path('..', __dir__)
  end

  def monorepo_config
    # TODO: Try to leverage middleman to load the config file, and avoid manually parsing
    @monorepo_config ||= Psych.load(File.read(File.expand_path('../data/monorepo.yml', __dir__)), symbolize_names: true)
  end
end

::Middleman::Extensions.register(:monorepo) do
  MonorepoExtension
end
