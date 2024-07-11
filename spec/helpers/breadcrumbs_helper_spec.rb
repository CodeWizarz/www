require 'spec_helper'
require_relative '../../helpers/breadcrumbs_helper'

describe BreadcrumbsHelper do
  class FakeTemplate
    extend BreadcrumbsHelper
  end

  describe '#breadcrumbs' do
    subject { FakeTemplate.breadcrumbs(communication_page, wrapper: wrapper, separator: separator, hide_home: hide_home, convert_last: convert_last) }
    let(:wrapper) { :li }
    let(:separator) { '' }
    let(:hide_home) { true }
    let(:convert_last) { false }

    let(:communication_page) do
      instance_double(
        'Middleman::Sitemap::Resource',
        parent: handbook_page,
        data: double('title' => 'Communication'),
        metadata: {},
        url: '/handbook/communication',
        request_path: 'handbook/communication/index.html'
      )
    end

    let(:handbook_page) do
      instance_double(
        'Middleman::Sitemap::Resource',
        parent: root_page,
        data: double('title' => 'Handbook'),
        metadata: {},
        url: '/handbook',
        request_path: 'handbook/index.html'
      )
    end

    let(:root_page) do
      instance_double(
        'Middleman::Sitemap::RedirectResource',
        parent: nil,
        data: double(title: nil),
        metadata: {},
        url: '/',
        request_path: 'index.html'
      )
    end

    it 'shows current page and adds a link to the parent page' do
      is_expected.to eq '<li><a href="/handbook">Handbook</a></li><li>Communication</li>'
    end

    context 'when wrapper is missing' do
      let(:wrapper) { nil }

      it 'does not wrap a link' do
        is_expected.to eq '<a href="/handbook">Handbook</a><li>Communication</li>'
      end
    end

    context 'when separator is set' do
      let(:separator) { '!!!' }

      it 'adds separator between breadcrumb elements' do
        is_expected.to eq '!!!<li><a href="/handbook">Handbook</a></li>!!!<li>Communication</li>'
      end
    end

    context 'when hide_home is false' do
      let(:hide_home) { false }

      it 'renders a link to the home page' do
        is_expected.to eq '<li><a href="/"></a></li><li><a href="/handbook">Handbook</a></li><li>Communication</li>'
      end
    end

    context 'when convert_last is true' do
      let(:convert_last) { true }

      it 'renders a link to the current page too' do
        is_expected.to eq '<li><a href="/handbook">Handbook</a></li><li><a href="/handbook/communication">Communication</a></li>'
      end
    end
  end
end
