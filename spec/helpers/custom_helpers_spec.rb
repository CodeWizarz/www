require 'spec_helper'
require_relative '../../helpers/custom_helpers'

describe CustomHelpers do
  class TemplateMock
    extend CustomHelpers
  end

  class Site
    attr_accessor :repo, :path, :instance

    def initialize
      @repo = 'https://gitlab.com/gitlab-com/www-gitlab-com/'
      @path = 'gitlab-com/www-gitlab-com'
      @instnace = 'https://gitlab.com'
    end
  end

  describe 'handbook_product_page?' do
    context 'handbook product page' do
      let(:relative_path) { 'handbook/product/product-processes/communication.html.md' }

      it 'returns true' do
        expect(TemplateMock.handbook_product_page?(relative_path)).to be(true)
      end
    end

    context 'not handbook product page' do
      let(:relative_path) { 'handbook/product-management/index.html.md' }

      it 'returns false' do
        expect(TemplateMock.handbook_product_page?(relative_path)).to be(false)
      end
    end
  end

  describe 'editor urls' do
    let(:relative_path) { 'handbook/product/product-processes/communication.html.md' }
    let(:monorepo_site_path_fragment) { 'sites/handbook/' }
    let(:site) { Site.new }
    let(:link_class) { 'external-link' }

    context 'web_ide_url' do
      it 'generates a url that opens source file in the web ide' do
        url = TemplateMock.web_ide_url(site, monorepo_site_path_fragment, relative_path)
        expected_url = "#{site.instance}-/ide/project/#{site.path}edit/master/-/#{monorepo_site_path_fragment}source/#{relative_path}"

        expect(url).to eq(expected_url)
      end
    end

    context 'blob_editor_url' do
      it 'generates a link that opens source file in the blob editor' do
        url = TemplateMock.blob_editor_url(site, monorepo_site_path_fragment, relative_path)
        expected_url = "#{site.repo}blob/master/#{monorepo_site_path_fragment}source/#{relative_path}"

        expect(url).to eq(expected_url)
      end
    end
  end

  describe 'availability_performance_indicator' do
    it 'returns availability' do
      performance_indicators = YAML
        .safe_load(File.read('data/performance_indicators/infrastructure_department.yml'))

      allow(TemplateMock)
        .to receive(:fetch_performance_indicators_for_org)
        .and_return(performance_indicators)

      availability = TemplateMock.availability_performance_indicator

      expect(availability).to be_present
      expect(availability['sisense_data']).to be_present
    end
  end
end
