require 'spec_helper'

describe Changelog::MergeRequest do
  subject(:merge_request) { described_class.new(iid, title, labels) }
  let(:iid) { 1 }
  let(:title) { 'test' }
  let(:labels) { nil }

  describe '#changelog_entry?' do
    subject { merge_request.changelog_entry? }

    before do
      allow(Gitlab).to receive(:merge_request_changes) { changes }
    end

    context 'when there are changes to handbook' do
      let(:changes) { { 'changes' => [{ 'new_path' => 'sites/handbook/source/handbook/my_page.md' }] } }

      it { is_expected.to be_truthy }
    end

    context 'when there are changes to other pages' do
      let(:changes) { { 'changes' => [{ 'new_path' => 'source/blog/new_post.md' }] } }

      it { is_expected.to be_falsey }
    end

    context 'when labels contain no changelog label' do
      let(:labels) { ['fix', 'no changelog'] }

      it { is_expected.to be_falsey }
    end

    context 'when there are no changes' do
      let(:changes) { {} }

      it { is_expected.to be_falsey }
    end
  end

  describe '#date' do
    subject { merge_request.date }
    let(:default_date) { DateTime.new(1970, 1, 1) }

    before do
      allow(Gitlab).to receive(:merge_request) { double(merged_at: merged_at) }
    end

    context 'when merged at is missing' do
      let(:merged_at) { nil }

      it { is_expected.to eq(default_date) }
    end

    context 'when merged at is not a string' do
      let(:merged_at) { 123456 }

      it { is_expected.to eq(default_date) }
    end

    context 'when merged at is a date string' do
      let(:merged_at) { '2020-01-01' }

      it { is_expected.to eq(DateTime.new(2020, 1, 1)) }
    end
  end

  describe '#merged_at' do
    subject { merge_request.merged_at }

    before do
      allow(Gitlab).to receive(:merge_request) { double(merged_at: merged_at) }
    end

    let(:merged_at) { '2020-01-01T00:00:00' }

    it 'returns merged_at date' do
      is_expected.to eq(merged_at)
    end
  end

  describe '#to_s' do
    subject { merge_request.to_s }

    it 'creates a markdown line' do
      is_expected.to eq('- [!1](https://gitlab.com/gitlab-com/www-gitlab-com/merge_requests/1) test')
    end
  end

  describe '#link' do
    subject { merge_request.link }

    it { is_expected.to eq 'https://gitlab.com/gitlab-com/www-gitlab-com/merge_requests/1' }
  end

  describe '#author' do
    subject { merge_request.author }

    before do
      allow(Gitlab).to receive(:merge_request) { double(author: double(name: author_name)) }
    end

    let(:author_name) { 'John' }

    it { is_expected.to eq author_name }
  end

  describe '#changes' do
    subject { merge_request.changes }

    before do
      allow(Gitlab).to receive(:merge_request_changes) { { 'changes' => [] } }
    end

    it { is_expected.to eq('changes' => []) }
  end
end
