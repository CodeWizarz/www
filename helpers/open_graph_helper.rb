# A helper module to handle open graph meta tags
module OpenGraphHelper
  # Given a site_url and current page object, return the correct open graph image tags
  #
  # @param [String] site_url - a value for the current site_url,
  # provided by `data.site.url` in source/includes/layout/meta.html.haml
  # @param [Middleman::Sitemap::Resource] current_page - a Middleman resource,
  # also provided in source/includes/layout/meta.html.haml
  # @return [String] - an HTML string with the appropriate og:image and twitter:image tags
  def open_graph_image_tags(site_url, current_page)
    <<~HTML
      <meta content="#{site_url}#{og_image(current_page.data)}" property="og:image">
      <meta content="#{site_url}#{og_image(current_page.data)}" name="twitter:image">
    HTML
  end

  # Checks the current_page data for twitter_image, image_title, and categories
  #
  # @param [#twitter_image, #image_title, #categories] - an object that responds to messages asking for relevant page data
  # @return [String] - the string representing the appropriate image path
  def og_image(data)
    if data.twitter_image
      data.twitter_image
    elsif data.image_title
      data.image_title
    elsif data.categories
      category_images[data.categories]
    else
      '/images/opengraph/gitlab-blog-cover.png'
    end
  end

  # Defines the correct images based on category
  #
  # @return [Hash] - category images, used in `#og_image`.
  def category_images
    {
      'engineering' => '/images/blogimages/library/engineering.png',
      'open source' => '/images/blogimages/library/open-source-community.png',
      'culture' => '/images/blogimages/library/remote-work.png',
      'insights' => '/images/blogimages/library/insights.png',
      'news' => '/images/default-blog-image.png',
      'security' => '/images/blogimages/security-cover.png',
      'unfiltered' => '/images/blogimages/gitlab-values-cover.png',
      'releases' => '/images/default-blog-image.png'
    }
  end
end
