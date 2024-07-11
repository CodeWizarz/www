# frozen_string_literal: true

require 'middleman'

#
# This middleman extension is used to speed up builds on CI
#
# We effectively do this by leveraging our CI parallelism features and split the build into
# distinct partitions.  Note that this is actively being refactored as part of the monorepo effort.
# See docs/monorepo.md for more details:
#
# * `PROXY_RESOURCE`: We leverage the `proxy` feature of middleman to generate e.g. job pages,
#    direction pages and others
# * `BLOG_POST_OLD`: All blog posts up to 2017
# * `BLOG_POST_NEW`: All blog posts since 2018
# * `RELEASE_BLOG`: Release blog posts
# * `COMPANY`: All company pages and team images
# * `ALL_OTHERS`: All pages and files which do not fit into the categories above
#
# If `CI_NODE_INDEX` and `CI_NODE_TOTAL` are not set, e.g. on development machines, or turning
# parallelism off, it will simply be a noop extension
class PartialBuildUncategorized < Middleman::Extension
  PROXY_RESOURCE = "proxy resources"
  BLOG_POST_OLD = "blog posts old (up to 2017)"
  BLOG_POST_NEW = "blog posts new (since 2018)"
  RELEASE_BLOG = "release blog"
  COMPANY = "Company pages and team images"
  ALL_OTHERS = "all other pages"

  # We must ensure that this extension runs last, so that
  # the filtering works correctly
  self.resource_list_manipulator_priority = 1000

  def_delegator :@app, :logger

  def initialize(app, options_hash = {}, &block)
    super
    @enabled = ENV['CI_NODE_INDEX'] && ENV['CI_NODE_TOTAL'] || ENV['CI_BUILD_PROXY_RESOURCE']

    if ENV['CI_BUILD_PROXY_RESOURCE']
      @partial = PROXY_RESOURCE
      return
    end

    return unless @enabled

    expected_jobs = 5

    raise "#{self.class.name}: If you want to enable parallel builds, please use exactly #{expected_jobs} parallel jobs. (CI_NODE_TOTAL='#{ENV['CI_NODE_TOTAL']}')" unless ENV['CI_NODE_TOTAL'].to_i == expected_jobs

    @partial = case ENV['CI_NODE_INDEX']
               when "1"
                 BLOG_POST_OLD
               when "2"
                 BLOG_POST_NEW
               when "3"
                 RELEASE_BLOG
               when "4"
                 COMPANY
               when "5"
                 ALL_OTHERS
               else
                 raise "#{self.class.name}: Invalid Build Partial #{ENV['CI_NODE_INDEX']}. At the moment we only support 1 to #{expected_jobs}"
               end
  end

  def manipulate_resource_list(resources)
    unless @enabled
      logger.info "#{self.class.name}: CI environment variables were not set for a partial build; building everything"
      return resources
    end

    logger.info "#{self.class.name}: We are building the partial: #{@partial}"

    resources.select { |resource| part_of_partial?(resource) }
  end

  private

  # INDEPENDENTLY BUILT RESOURCES

  def independently_built_resource?(resource)
    # TODO: Are these explicit exclusions still needed now that the handbook has its own sub-site and config?
    images?(resource) ||
      handbook?(resource) ||
      assets?(resource)
  end

  def images?(resource)
    resource.destination_path.start_with?('images/') && !image_handled_by_company?(resource)
  end

  def handbook?(resource)
    resource.destination_path.start_with?('handbook/')
  end

  def assets?(resource)
    # NOTE that this does NOT include any PDFs, because those end up being handled by middleman in other partials anyway,
    # because they are referred to by proxy resources or `link_to` tags.
    resource.destination_path.start_with?(
      'ico/'
    )
  end

  # PROXY RESOURCES

  def proxy_resource?(resource)
    return false if independently_built_resource?(resource)

    return true if resource.destination_path =~ %r{sitemaps/sitemap_proxy_resource} # Child sitemap for this partial build

    # TODO: The rest of these need to eventually be moved to be the responsibility of individual sites
    resource.instance_of?(Middleman::Sitemap::ProxyResource) ||
      resource.destination_path.start_with?('templates/', 'direction/', 'sales/') ||
      resource.destination_path.end_with?('/template.html', 'category.html')
  end

  # PARTIAL BUILD RESOURCES

  def blog_post_old?(resource)
    return true if resource.destination_path =~ %r{sitemaps/sitemap_blog_page_old} # Child sitemap for this partial build

    !proxy_resource?(resource) &&
      resource.destination_path.start_with?(
        'blog/2011',
        'blog/2012',
        'blog/2012',
        'blog/2013',
        'blog/2014',
        'blog/2015',
        'blog/2016',
        'blog/2017'
      )
  end

  def blog_post_new?(resource)
    return true if resource.destination_path =~ %r{sitemaps/sitemap_blog_page_new} # Child sitemap for this partial build

    !proxy_resource?(resource) &&
      ((resource.destination_path.start_with?('blog/') && !blog_post_old?(resource)) ||
        resource.destination_path.end_with?('atom.xml'))
  end

  def release_blog?(resource)
    return true if resource.destination_path =~ %r{sitemaps/sitemap_release_blog} # Child sitemap for this partial build

    !proxy_resource?(resource) &&
      resource.destination_path.start_with?(
        'releases/'
      )
  end

  def company?(resource)
    return true if resource.destination_path =~ %r{sitemaps/sitemap_company} # Child sitemap for this partial build

    return false if proxy_resource?(resource)

    image_handled_by_company?(resource) ||
      resource.destination_path.start_with?(
        'company/team',
        'company/team-pets',
        'company/culture/all-remote/stories',
        'community/core-team'
      )
  end

  def image_handled_by_company?(resource)
    # Logic extracted out to prevent endless loops which would happen if #images? called #company? directly
    resource.destination_path.start_with?(
      'images/team/'
    )
  end

  def all_others?(resource)
    # Sitemap handling
    return true if resource.destination_path == 'sitemap.xml' # Include root sitemap index
    return true if resource.destination_path =~ %r{sitemaps/sitemap_all_others} # Include child sitemap for this partial build
    return false if resource.destination_path =~ %r{sitemaps/} # Do not include child sitemaps for any other partial builds

    return false if independently_built_resource?(resource)

    !proxy_resource?(resource) &&
      !blog_post_new?(resource) &&
      !blog_post_old?(resource) &&
      !release_blog?(resource) &&
      !company?(resource)
  end

  def part_of_partial?(resource)
    return false if independently_built_resource?(resource)

    case @partial
    when PROXY_RESOURCE
      proxy_resource?(resource)
    when BLOG_POST_OLD
      blog_post_old?(resource)
    when BLOG_POST_NEW
      blog_post_new?(resource)
    when RELEASE_BLOG
      release_blog?(resource)
    when COMPANY
      company?(resource)
    when ALL_OTHERS
      all_others?(resource)
    else
      raise "#{self.class.name}: You are trying to build a unknown partial: #{@partial}"
    end
  end
end

::Middleman::Extensions.register(:partial_build_uncategorized, PartialBuildUncategorized)
