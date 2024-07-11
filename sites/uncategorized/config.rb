#--------------------------------------
# Monorepo-related configuration
#--------------------------------------

monorepo_root = File.expand_path('../..', __dir__)

# hack around relative requires elsewhere in the shared code by adding the monorepo root to the load path
$LOAD_PATH.unshift(monorepo_root)

set :data_dir, "#{monorepo_root}/data"
set :helpers_dir, "../../helpers" # This has to be relative, because Middleman's ExternalHelpers#after_configuration uses File.join(app.root, ...)

require_relative '../../extensions/monorepo.rb'
activate :monorepo do |monorepo|
  monorepo.site = 'uncategorized'
end

#--------------------------------------
# End of Monorepo-related configuration
#--------------------------------------

require 'generators/direction'
require 'generators/prodops_direction'
require 'generators/releases'
require 'generators/release_page'
require 'extensions/only_debugged_resources'
require 'extensions/partial_build_uncategorized'
require 'extensions/destination_path_regexes_filter'
require 'extensions/listen_monkeypatch'
require 'extensions/proxy_server_information'
require 'extensions/open_graph'
require 'lib/team'
require 'lib/code_owners'
require 'lib/homepage'
require 'lib/mermaid'
require 'lib/plantuml'

#----------------------------------------------------------
# Global config (not specific to development or build mode)
#----------------------------------------------------------

# Settings
set :haml, { format: :xhtml }
set :markdown_engine, :kramdown
set :markdown, tables: true, hard_wrap: false, input: 'GFM'

# Disable HAML warnings
# https://github.com/middleman/middleman/issues/2087#issuecomment-307502952
Haml::TempleEngine.disable_option_validator!

# Paths with custom per-page overrides
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page '/*.yml', layout: false
page '/404.html', directory_index: false

# Don't render or include the following into the sitemap
ignore '/direction/*' unless ENV['PRIVATE_TOKEN']
ignore '/frontend/*'
ignore '/templates/*'
ignore '/includes/*'
ignore '/upcoming-releases/template.html'
ignore '/releases/template.html'
ignore '/releases/gitlab-com/template.html'
ignore '/company/team/structure/org-chart/template.html'
ignore '/source/stylesheets/highlight.css'
ignore 'source/job-families/check_job_families.py'
ignore '/category.html'
ignore '/.gitattributes'
ignore '**/.gitkeep'
ignore '/sites/*'
ignore '/experiments/*'
# Ignore javascripts and stylesheets directories since Webpack will handle them
ignore 'javascripts/*'
ignore 'stylesheets/*'

# Extensions
activate :syntax, line_numbers: false
if ENV['MIDDLEMAN_DEBUG_RESOURCE_REGEX']
  ::Middleman::Extensions.register(:only_debugged_resources, OnlyDebuggedResources)
  activate :only_debugged_resources
end
activate :partial_build_uncategorized # Handle splitting of files across CI jobs
activate :open_graph # Add open graph helpers and utilities
activate :inline_svg # A Middleman extension embed SVG documents in your Middleman views.

# Blog and Release extensions
unless ENV['SKIP_BLOG']
  activate :blog do |blog|
    blog.name = 'blog'
    # This will add a prefix to all links, template references and source paths
    blog.prefix = 'blog'
    blog.sources = 'blog-posts/{year}-{month}-{day}-{title}.html'
    blog.permalink = '/{year}/{month}/{day}/{title}/index.html'
    blog.layout = 'includes/cms/blog_post/slippers-blog-post'
    blog.paginate = true
    blog.page_link = "p{num}"
    blog.per_page = 17

    # Allow draft posts to appear on all branches except master (for Review Apps)
    blog.publish_future_dated = true if ENV['CI_COMMIT_REF_NAME'].to_s != 'master'

    blog.summary_separator = /<!--\s*more\s*-->/

    blog.custom_collections = {
      categories: {
        link: '/categories/{categories}/index.html',
        template: '/category.html'
      },
      subcategories: {
        link: '/categories/{categories}/{subcategories}/index.html',
        template: '/category.html'
      }
    }
  end

  activate :blog do |blog|
    blog.name = 'releases'
    # This will add a prefix to all links, template references and source paths
    blog.prefix = 'releases'
    blog.sources = 'posts/{year}-{month}-{day}-{title}.html'
    blog.permalink = '/{year}/{month}/{day}/{title}/index.html'
    blog.layout = 'post'
    blog.paginate = true
    blog.page_link = "p{num}"
    blog.per_page = 17

    # Allow draft posts to appear on all branches except master (for Review Apps)
    blog.publish_future_dated = true if ENV['CI_BUILD_REF_NAME'].to_s != 'master'

    blog.summary_separator = /<!--\s*more\s*-->/

    blog.custom_collections = {
      categories: {
        link: '/categories/{categories}/index.html',
        template: '/category.html'
      },
      subcategories: {
        link: '/categories/{categories}/{subcategories}/index.html',
        template: '/category.html'
      }
    }
  end
end

# Analyst reports
data.analyst_reports.each do |report|
  next unless report.url

  proxy "/analysts/#{report.url}/index.html", '/analysts/template.html', locals: {
    report: report
  }, ignore: true
end

# Webcast pages
data.webcasts.each do |webcast|
  proxy "/webcast/#{webcast.url.tr(' ', '-')}/index.html", '/webcast/template.html', locals: {
    webcast: webcast
  }, ignore: true
end

# Release Radars /webcast/monthly-release
data.release_radars.each do |release_radar|
  proxy "/webcast/monthly-release/#{release_radar.name.tr(' ', '-').downcase}/index.html", '/webcast/monthly-release/template.html', locals: {
    release_radar: release_radar
  }, ignore: true
end

# Proxy slippers solution for contruction of solution template
data.solution_slippers.each do |filename, solution_slippers|
  proxy "/solutions/#{filename}/index.html", '/templates/slippers-solution.html', locals: { event: solution_slippers }, ignore: true
end

# Proxy child solution pages - use the same templating as solution parents, but different destination path/local variable
data.solution_children.each do |filename, solution_child|
  proxy "/solutions/#{solution_child.parent_solution}/#{filename}/index.html", '/templates/slippers-solution.html', locals: { event: solution_child }
end

# Proxy slippers customers for contruction of case studies only
data.case_studies_slippers.each do |filename, customer_slippers|
  proxy "/customers/#{filename}/index.html", '/templates/slippers-customer-reference.html', locals: { customer: customer_slippers }, ignore: true
end

#----------------------------------------------------------
# End global config (not specific to development or build mode)
#----------------------------------------------------------

# Development-specific config
configure :development do
  # Reload the browser automatically whenever files change
  activate :livereload unless ENV['ENABLE_LIVERELOAD'] != '1'

  # Opt-in only monkeypatch to override sitemap regeneration in preview server
  # Set the DISABLE_ON_DISK_REBUILD=true to build the sitemap only once while running `middleman serve`
  # This will break some dynamic paths, but it will make individual template development much faster.
  # Use this if you're working on a handful of template files and care more about editing the markup than the content.
  require 'extensions/update_files_monkeypatch' if ENV['DISABLE_ON_DISK_REBUILD']

  # External Pipeline
  unless ENV['SKIP_EXTERNAL_PIPELINE']
    # NOTE: if we use the external pipeline, we set the Middleman port to 7654,
    # which the webpack devServer config relies on in webpack.config.js in the project root.
    # We set up webpack devServer on port 4567 to keep the local dev commands the same,
    # but it proxies to 7654 for everything other than the webpack assets.
    # See doc/webpack.md for more information.
    set(:port, 7654)
    # This Middleman extension logs a custom message about the Webpack proxy port
    activate :proxy_server_information
    # NOTE: This only applies to 'development' mode.  For local builds, use the `rake build:*` tasks
    # NOTE: This runs webpack and makes assets available during local development
    activate :external_pipeline,
             name: :webpack,
             command: "cd #{monorepo_root} && yarn run start-webpack",
             source: "#{monorepo_root}/tmp/dist",
             latency: 3
  end

  activate :autoprefixer do |config|
    config.browsers = ['last 2 versions', 'Explorer >= 9']
  end

  # Milestone when deprecations were moved into docs
  config[:latest_deprecation_release] = Gem::Version.new(14.0)

  # Milestone when bugs, performance, and UX issues were no longer listed on the release post
  config[:bugs_ux_performance_linked_to_filtered_list] = Gem::Version.new(14.8)
end

# Build-specific config
configure :build do
  # Milestone when deprecations were moved into docs
  config[:latest_deprecation_release] = Gem::Version.new(14.0)

  # Milestone when bugs, performance, and UX issues were no longer listed on the release post
  config[:bugs_ux_performance_linked_to_filtered_list] = Gem::Version.new(14.8)

  Kramdown::Converter::PlantUmlHtmlWrapper.plantuml_setup

  # Mermaid diagrams don't render without line breaks
  activate :minify_html, preserve_line_breaks: true

  # Begin proxy resources

  # Populate the direction and releases pages only if INCLUDE_GENERATORS is true
  # That will help shave off some time of the build times when they are not needed
  if ENV['INCLUDE_GENERATORS'] == 'true'

    # Direction page
    if ENV['PRIVATE_TOKEN']
      content = {}
      direction = Generators::Direction.new
      prodops_direction = Generators::ProdOpsDirection.new

      wishlist = direction.generate_wishlist # wishlist, shared by most pages
      direction_all_content = direction.generate_direction(Generators::Direction::STAGES, Generators::Direction::INCLUDE_EPICS) # /direction/*
      direction_dev_content = direction.generate_direction(Generators::Direction::DEV_STAGES, Generators::Direction::INCLUDE_EPICS) # /direction/dev/
      direction_sec_content = direction.generate_direction(Generators::Direction::SEC_STAGES, Generators::Direction::INCLUDE_EPICS) # /direction/sec/
      direction_ops_content = direction.generate_direction(Generators::Direction::OPS_STAGES, Generators::Direction::INCLUDE_EPICS) # /direction/ops/
      direction_enablement_content = direction.generate_direction(Generators::Direction::ENABLEMENT_STAGES, Generators::Direction::INCLUDE_EPICS) # /direction/ops/

      # Set second argument to 'true' to include Epics, third to 'true' to include Merge Requests
      # Each string in 'prod_ops_label_sets' array generates one list of Issues/MRs/Epics from current and recent milestones
      prod_ops_label_sets = [
        'prodops:direction,Product Operations,prodops:knowledge',
        'prodops:direction,Product Operations,prodops:feedbackloops',
        'prodops:direction,Product Operations,prodops:outcomes'
      ]
      direction_prod_ops_content = prodops_direction.generate_prod_ops_direction(prod_ops_label_sets, true, true) # /direction/product-operations/

      Generators::Direction::STAGES.each do |name|
        # Fetch content for per-team pages
        skip = %w[release verify] # these do not have a team page
        content[name] = direction.generate_direction(%W[#{name}], Generators::Direction::INCLUDE_EPICS) unless skip.include? name # /direction/name/
      end

      stage_contribution_content = direction.generate_contribution_count(data.stages) # /direction/maturity/
      stage_velocity = direction.generate_stage_velocity(data.stages) # /direction/maturity/

      milestones = direction.generate_milestones # /releases/gitlab-com

      # Set up proxies using now-fetched content for shared pages
      proxy '/upcoming-releases/index.html', '/upcoming-releases/template.html', locals: { direction: direction_all_content }, ignore: true
      proxy '/direction/paid_tiers/index.html', '/direction/paid_tiers/template.html', locals: { wishlist: wishlist }, ignore: true
      proxy '/releases/gitlab-com/index.html', '/releases/gitlab-com/template.html', locals: { milestones: milestones }, ignore: true
      proxy '/direction/dev/index.html', '/direction/dev/template.html', locals: { direction: direction_dev_content }, ignore: true
      proxy '/direction/ops/index.html', '/direction/ops/template.html', locals: { direction: direction_ops_content }, ignore: true
      proxy '/direction/enablement/index.html', '/direction/enablement/template.html', locals: { direction: direction_enablement_content }, ignore: true
      proxy '/direction/maturity/index.html', '/direction/maturity/template.html', locals: { stage_contributions: stage_contribution_content, stage_velocity: stage_velocity }, ignore: true
      proxy '/direction/kickoff/index.html', '/direction/kickoff/template.html', locals: { direction: direction_all_content }, ignore: true
      proxy '/direction/security/index.html', '/direction/security/template.html', locals: { direction: direction_sec_content }, ignore: true
      proxy '/direction/index.html', '/direction/template.html', locals: { wishlist: wishlist }, ignore: true
      proxy '/direction/product-operations/index.html', 'direction/product-operations/template.html', locals: { direction: direction_prod_ops_content }, ignore: true

      Generators::Direction::STAGES.each do |name|
        # And for team pages
        skip = %w[verify] # this do not have a team page
        proxy "/direction/#{name}/index.html", "/direction/#{name}/template.html", locals: { direction: content[name], wishlist: wishlist }, ignore: true unless skip.include? name
      end
    end

    ## Releases page
    release_page = ReleasePage.new
    proxy '/releases/index.html', '/releases/template.html', locals: {
      count: release_page.releases_count,
      releases_data: release_page.releases_data,
      active_version: release_page.active_version
    }, ignore: true
  end
  # End proxy resources
end
