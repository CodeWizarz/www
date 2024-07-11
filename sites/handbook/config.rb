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
  monorepo.site = 'handbook'
end

#--------------------------------------
# End of Monorepo-related configuration
#--------------------------------------

require 'extensions/only_debugged_resources'
require 'extensions/partial_build_handbook'
require 'extensions/proxy_server_information'
require 'extensions/open_graph'
require "lib/homepage"
require "lib/team"
require 'lib/mermaid'
require 'lib/plantuml'
require 'lib/code_owners'
require 'generators/prodops_direction'

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

# Don't render or include the following into the sitemap
ignore '**/.gitkeep'

# Extensions
activate :syntax, line_numbers: false
if ENV['MIDDLEMAN_DEBUG_RESOURCE_REGEX']
  ::Middleman::Extensions.register(:only_debugged_resources, OnlyDebuggedResources)
  activate :only_debugged_resources
end
activate :partial_build_handbook # Handle splitting of files across CI jobs
activate :open_graph # Add open graph helpers and utilities

# Compensation Roadmaps
data.compensation_roadmaps.each do |compensation_roadmap|
  proxy "/handbook/engineering/compensation-roadmaps/#{compensation_roadmap.slug}/index.html", "/handbook/engineering/compensation-roadmaps/template.html", locals: {
    compensation_roadmap: compensation_roadmap
  }, ignore: true
end

# GitLab Projects
proxy '/handbook/engineering/projects/index.html',
      '/handbook/engineering/projects/template.html',
      locals: { team: Gitlab::Homepage.team },
      ignore: true

if ENV['PRIVATE_TOKEN']
  prodops_direction = Generators::ProdOpsDirection.new
  # Set second argument to 'true' to include Epics, third to 'true' to include Issues, forth to 'true' to include Merge Requests
  # Each string in 'prod_ops_label_sets' array generates one list of Issues/MRs/Epics from current and recent milestones
  # NOTE: The order of labels in the string must match in the corresponding template file. Otherwise, no results will appear
  pdf_releases_labels = ['Product Operations,product development flow,prodops:release']
  pdf_release_blog_labels = ['Product Operations,release post,prodops:release']
  pdf_release_handbook_labels = ['Product Operations,product handbook,prodops:release']
  pdf_templates_labels = ['Product Operations,templates,prodops:release']

  pdf_releases = prodops_direction.labeled_items_by_milestone(pdf_releases_labels, false, false, true)
  pdf_release_blog = prodops_direction.labeled_items_by_milestone(pdf_release_blog_labels, false, false, true)
  pdf_release_handbook = prodops_direction.labeled_items_by_milestone(pdf_release_handbook_labels, false, false, true)
  pdf_templates = prodops_direction.labeled_items_by_milestone(pdf_templates_labels, false, false, true)

  proxy '/handbook/product-development-flow/releases/index.html', '/handbook/product-development-flow/releases/template.html', locals: {
    pdf_releases: pdf_releases
  }, ignore: true
  proxy '/handbook/marketing/blog/release-posts/process-updates/index.html', '/handbook/marketing/blog/release-posts/process-updates/template.html', locals: {
    pdf_release_blog: pdf_release_blog
  }, ignore: true
  proxy '/handbook/product/handbook-updates/index.html', '/handbook/product/handbook-updates/template.html', locals: {
    pdf_release_handbook: pdf_release_handbook
  }, ignore: true
  proxy '/handbook/product/product-operations/template-updates/index.html', '/handbook/product/product-operations/template-updates/template.html', locals: {
    pdf_templates: pdf_templates
  }, ignore: true
else
  # Product Operations page item generators that require variables defined above
  ignore '/handbook/product-development-flow/*'
  ignore '/handbook/marketing/blog/release-posts/process-updates/*'
  ignore '/handbook/product/handbook-updates/*'
  ignore '/handbook/product/product-operations/template-updates/*'
end

#----------------------------------------------------------
# End global config (not specific to development or build mode)
#----------------------------------------------------------

# Development-specific config
configure :development do
  # There is no root index.html in handbook sub-site, so redirect root to handbook/index.html
  redirect "index.html", to: "/handbook/index.html"

  # Reload the browser automatically whenever files change
  activate :livereload unless ENV['ENABLE_LIVERELOAD'] != '1'

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
end

# Build-specific configuration
configure :build do
  Kramdown::Converter::PlantUmlHtmlWrapper.plantuml_setup

  # Mermaid diagrams don't render without line breaks
  activate :minify_html, preserve_line_breaks: true
end
