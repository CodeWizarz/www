# A helper module to handle data in blog posts programmatically.
module BlogHelper
  # Given a author name in the form of a string, return the `Gitlab::Homepage::Team::Member` object for a person with the matching name.
  #
  # @param [string] author - the team member's name, So use `Tyler Williams` or `Lauren Barker` for example.
  # @return [Gitlab::Homepage::Team::Member] - this class is defined in `lib/team/member.rb` and exposed to us through `lib/homepage.rb`
  def author_data(author:)
    Gitlab::Homepage.team.members.detect { |member| member.name == author }
  end

  # Define reading time
  def reading_time(input)
    words_per_minute = 180
    words = input.split.size
    minutes = (words / words_per_minute).floor
    minutes.positive? ? "#{minutes} min read" : "less than 1 minute"
  end

  # Generate blog posts schema markup
  def generate_blog_post_schema(post, article, page)
    # Check if post has author and assign GitLab if it does not
    author = if post.author && post.author_gitlab
               {
                 "@type" => "Person",
                 "name" => post.author,
                 "url" => "https://about.gitlab.com/company/team/#" + post.author_gitlab
               }
             elsif post.author
               {
                 "@type" => "Person",
                 "name" => post.author,
                 "url" => "https://about.gitlab.com/company/team/"
               }
             else
               {
                 "@type" => "Organization",
                 "name" => "GitLab",
                 "url" => "https://about.gitlab.com/company/team/"
               }
             end
    image = post.image_title ? "https://about.gitlab.com" + post.image_title : "https://about.gitlab.com/images/press/logo/png/gitlab-logo-500.png"
    # Create blog post schema
    schema = {
      "@context" => "https://schema.org",
      "@type" => "BlogPosting",
      "mainEntityOfPage" => {
        "@type" => 'WebPage',
        "@id" => "https://about.gitlab.com" + page.url
      },
      "headline" => post.title,
      "description" => post.description,
      "image" => image,
      "keywords" => post.tags,
      "articleSection" => post.categories,
      "timeRequired" => reading_time(article.body),
      "author" => author,
      "publisher" => {
        "@type" => "Organization",
        "name" => "GitLab",
        "logo" => {
          "@type" => "ImageObject",
          "url" => "https://about.gitlab.com/images/press/logo/png/gitlab-logo-500.png"
        }
      },
      "datePublished" => article.date.to_time.iso8601
    }
    schema.to_json.html_safe
  end
end
