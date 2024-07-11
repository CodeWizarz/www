require 'spec_helper'
require_relative '../../helpers/open_graph_helper'

describe OpenGraphHelper do
  let(:dummy_class) { Class.new { extend OpenGraphHelper } }

  describe '#open_graph_image_tags' do
    let(:site_url) { 'https://about.gitlab.com' }

    let(:page_with_twitter_image) do
      instance_double(
        'Middleman::Sitemap::Resource',
        data: double('twitter_image' => '/path/to/twitter/image.png', 'image_title' => nil)
      )
    end

    let(:page_with_image_title) do
      instance_double(
        'Middleman::Sitemap::Resource',
        data: double('twitter_image' => nil, 'image_title' => '/image/title.png')
      )
    end

    let(:page_with_no_category) do
      instance_double(
        'Middleman::Sitemap::Resource',
        data: double('twitter_image' => nil, 'image_title' => nil, 'categories' => nil)
      )
    end

    let(:engineering_post) do
      instance_double(
        'Middleman::Sitemap::Resource',
        data: double('twitter_image' => nil, 'image_title' => nil, 'categories' => 'engineering')
      )
    end

    let(:open_source_post) do
      instance_double(
        'Middleman::Sitemap::Resource',
        data: double('twitter_image' => nil, 'image_title' => nil, 'categories' => 'open source')
      )
    end

    let(:culture_post) do
      instance_double(
        'Middleman::Sitemap::Resource',
        data: double('twitter_image' => nil, 'image_title' => nil, 'categories' => 'culture')
      )
    end

    let(:insights_post) do
      instance_double(
        'Middleman::Sitemap::Resource',
        data: double('twitter_image' => nil, 'image_title' => nil, 'categories' => 'insights')
      )
    end

    let(:news_post) do
      instance_double(
        'Middleman::Sitemap::Resource',
        data: double('twitter_image' => nil, 'image_title' => nil, 'categories' => 'news')
      )
    end

    let(:security_post) do
      instance_double(
        'Middleman::Sitemap::Resource',
        data: double('twitter_image' => nil, 'image_title' => nil, 'categories' => 'security')
      )
    end

    let(:unfiltered_post) do
      instance_double(
        'Middleman::Sitemap::Resource',
        data: double('twitter_image' => nil, 'image_title' => nil, 'categories' => 'unfiltered')
      )
    end

    let(:releases_post) do
      instance_double(
        'Middleman::Sitemap::Resource',
        data: double('twitter_image' => nil, 'image_title' => nil, 'categories' => 'releases')
      )
    end

    let(:tags_with_twitter_image) do
      <<~HTML
        <meta content="https://about.gitlab.com/path/to/twitter/image.png" property="og:image">
        <meta content="https://about.gitlab.com/path/to/twitter/image.png" name="twitter:image">
      HTML
    end

    let(:tags_with_image_title) do
      <<~HTML
        <meta content="https://about.gitlab.com/image/title.png" property="og:image">
        <meta content="https://about.gitlab.com/image/title.png" name="twitter:image">
      HTML
    end

    let(:default_tags) do
      <<~HTML
        <meta content="https://about.gitlab.com/images/opengraph/gitlab-blog-cover.png" property="og:image">
        <meta content="https://about.gitlab.com/images/opengraph/gitlab-blog-cover.png" name="twitter:image">
      HTML
    end

    let(:engineering_tags) do
      <<~HTML
        <meta content="https://about.gitlab.com/images/blogimages/library/engineering.png" property="og:image">
        <meta content="https://about.gitlab.com/images/blogimages/library/engineering.png" name="twitter:image">
      HTML
    end

    let(:open_source_tags) do
      <<~HTML
        <meta content="https://about.gitlab.com/images/blogimages/library/open-source-community.png" property="og:image">
        <meta content="https://about.gitlab.com/images/blogimages/library/open-source-community.png" name="twitter:image">
      HTML
    end

    let(:culture_tags) do
      <<~HTML
        <meta content="https://about.gitlab.com/images/blogimages/library/remote-work.png" property="og:image">
        <meta content="https://about.gitlab.com/images/blogimages/library/remote-work.png" name="twitter:image">
      HTML
    end

    let(:insights_tags) do
      <<~HTML
        <meta content="https://about.gitlab.com/images/blogimages/library/insights.png" property="og:image">
        <meta content="https://about.gitlab.com/images/blogimages/library/insights.png" name="twitter:image">
      HTML
    end

    let(:news_tags) do
      <<~HTML
        <meta content="https://about.gitlab.com/images/default-blog-image.png" property="og:image">
        <meta content="https://about.gitlab.com/images/default-blog-image.png" name="twitter:image">
      HTML
    end

    let(:security_tags) do
      <<~HTML
        <meta content="https://about.gitlab.com/images/blogimages/security-cover.png" property="og:image">
        <meta content="https://about.gitlab.com/images/blogimages/security-cover.png" name="twitter:image">
      HTML
    end

    let(:unfiltered_tags) do
      <<~HTML
        <meta content="https://about.gitlab.com/images/blogimages/gitlab-values-cover.png" property="og:image">
        <meta content="https://about.gitlab.com/images/blogimages/gitlab-values-cover.png" name="twitter:image">
      HTML
    end

    let(:releases_tags) do
      <<~HTML
        <meta content="https://about.gitlab.com/images/default-blog-image.png" property="og:image">
        <meta content="https://about.gitlab.com/images/default-blog-image.png" name="twitter:image">
      HTML
    end

    context 'when the page has a twitter_image' do
      subject { dummy_class.open_graph_image_tags(site_url, page_with_twitter_image) }
      it 'should return tags containing twitter_image' do
        is_expected.to eq tags_with_twitter_image
      end
    end

    context 'when the page has an image_title' do
      subject { dummy_class.open_graph_image_tags(site_url, page_with_image_title) }
      it 'should return tags containing twitter_image' do
        is_expected.to eq tags_with_image_title
      end
    end

    context 'when the page has no twitter_image or image_title' do
      context 'and has no category' do
        subject { dummy_class.open_graph_image_tags(site_url, page_with_no_category) }
        it 'should return the default tags' do
          is_expected.to eq default_tags
        end
      end

      context 'and is an engineering post' do
        subject { dummy_class.open_graph_image_tags(site_url, engineering_post) }
        it 'should return the default tags' do
          is_expected.to eq engineering_tags
        end
      end

      context 'and is an open source post' do
        subject { dummy_class.open_graph_image_tags(site_url, open_source_post) }
        it 'should return the default tags' do
          is_expected.to eq open_source_tags
        end
      end

      context 'and is a culture post' do
        subject { dummy_class.open_graph_image_tags(site_url, culture_post) }
        it 'should return the default tags' do
          is_expected.to eq culture_tags
        end
      end

      context 'and is an insights post' do
        subject { dummy_class.open_graph_image_tags(site_url, insights_post) }
        it 'should return the default tags' do
          is_expected.to eq insights_tags
        end
      end

      context 'and is a news post' do
        subject { dummy_class.open_graph_image_tags(site_url, news_post) }
        it 'should return the default tags' do
          is_expected.to eq news_tags
        end
      end

      context 'and is a security post' do
        subject { dummy_class.open_graph_image_tags(site_url, security_post) }
        it 'should return the default tags' do
          is_expected.to eq security_tags
        end
      end

      context 'and is an unfiltered post' do
        subject { dummy_class.open_graph_image_tags(site_url, unfiltered_post) }
        it 'should return the default tags' do
          is_expected.to eq unfiltered_tags
        end
      end

      context 'and is a releases post' do
        subject { dummy_class.open_graph_image_tags(site_url, releases_post) }
        it 'should return the default tags' do
          is_expected.to eq releases_tags
        end
      end
    end
  end
end
