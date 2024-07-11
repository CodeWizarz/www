require 'spec_helper'

describe Gitlab::Homepage::FastlyClient do
  before do
    allow(ENV).to receive(:fetch).with('FASTLY_SRV_ID') { service_id }
  end

  let(:service_id) { 'SERVICE_ID' }

  describe '.patch_snippet' do
    subject { described_class.patch_snippet(snippet_id, data) }
    let(:snippet_id) { '1' }
    let(:data) { 'content=code' }

    it 'updates a snippet' do
      stub_request(:put, "https://api.fastly.com/service/#{service_id}/snippet/#{snippet_id}")
        .with(
          body: { "content" => "code" },
          headers: { 'Content-Type' => 'application/x-www-form-urlencoded' }
        ).to_return(status: 200, body: "", headers: {})

      is_expected.to be_success
    end
  end

  describe '.get_dictionary_items' do
    subject { described_class.get_dictionary_items(dictionary_id) }
    let(:dictionary_id) { '1' }

    it 'fetches dictionary items' do
      stub_request(:get, "https://api.fastly.com/service/#{service_id}/dictionary/#{dictionary_id}/items")
        .with(
          headers: { 'Content-Type' => 'application/json' }
        ).to_return(status: 200, body: "", headers: {})

      is_expected.to be_success
    end
  end

  describe '.update_dictionary_items' do
    subject { described_class.update_dictionary_items(dictionary_id, items) }
    let(:dictionary_id) { '1' }
    let(:items) { [{ op: 'upsert', item_key: '/', item_value: '/help' }] }

    it 'updates a dictionary with list of items' do
      stub_request(:patch, "https://api.fastly.com/service/#{service_id}/dictionary/#{dictionary_id}/items")
        .with(
          body: { items: items }.to_json,
          headers: { 'Content-Type' => 'application/json' }
        ).to_return(status: 200, body: "", headers: {})

      is_expected.to be_success
    end
  end

  describe '.delete_dictionary_item' do
    subject { described_class.delete_dictionary_item(dictionary_id, item_key) }
    let(:dictionary_id) { '1' }
    let(:item_key) { '/' }

    it 'deletes an item from dictionary' do
      stub_request(:delete, "https://api.fastly.com/service/#{service_id}/dictionary/#{dictionary_id}/item/#{item_key}")
        .with(
          headers: { 'Content-Type' => 'application/json' }
        ).to_return(status: 200, body: "", headers: {})

      is_expected.to be_success
    end
  end
end
