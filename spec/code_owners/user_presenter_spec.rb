require 'spec_helper'

describe Gitlab::CodeOwners::UserPresenter do
  subject(:presenter) do
    described_class.new(team.map { |data| ::Gitlab::Homepage::Team::Member.new(data) })
  end

  let(:team) { [{ 'gitlab' => 'john', 'name' => 'John Smith', 'picture' => 'john.png' }] }

  let(:in_ci) { nil }

  before do
    allow(ENV).to receive(:[]).with('CI').and_return(in_ci)
  end

  describe '#present' do
    subject { presenter.present(username) }

    context 'when username is a real gitlab name' do
      let(:username) { '@john' }

      it { is_expected.to eq(description: 'John Smith', url: 'https://gitlab.com/john', gitlab_name: '@john', image_url: '/images/team/john.png') }

      context 'when we are in CI' do
        let(:in_ci) { '1' }

        it { is_expected.to eq(description: 'John Smith', url: 'https://gitlab.com/john', gitlab_name: '@john', image_url: '/images/team/john-crop.jpg') }
      end
    end

    context 'when username is an unknown gitlab name' do
      let(:username) { '@sam' }

      it { is_expected.to eq(description: '@sam', url: 'https://gitlab.com/sam', gitlab_name: '@sam', image_url: nil) }
    end

    context 'when username is an email' do
      let(:username) { 'john@gitlab.com' }

      it { is_expected.to eq(description: 'john@gitlab.com', url: nil, gitlab_name: nil, image_url: nil) }
    end

    context 'when user has a placeholder image' do
      let(:team) { [{ 'gitlab' => 'john', 'name' => 'John Smith', 'picture' => '../gitlab-logo-extra-whitespace.png' }] }
      let(:username) { '@john' }

      it { is_expected.to eq(description: 'John Smith', url: 'https://gitlab.com/john', gitlab_name: '@john', image_url: '/images/team/../gitlab-logo-extra-whitespace.png') }

      context 'when we are in CI' do
        let(:in_ci) { '1' }

        it { is_expected.to eq(description: 'John Smith', url: 'https://gitlab.com/john', gitlab_name: '@john', image_url: '/images/team/../gitlab-logo-extra-whitespace.png') }
      end
    end
  end
end
