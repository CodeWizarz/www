require 'spec_helper'

describe Gitlab::CodeOwners::OwnerValidator do
  subject(:validator) { described_class.new(data, team) }

  let(:team) do
    [{ 'gitlab' => 'User' }]
  end

  let(:data) { { '.' => '@user', 'source' => '@user' } }

  context 'when we do not pass a team' do
    subject(:validator) { described_class.new(data) }

    it 'gets the team from Gitlab::Homepage.team.members' do
      team = double(members: [])
      expect(::Gitlab::Homepage).to receive(:team).and_return(team)

      subject
    end
  end

  describe '#valid?' do
    subject { validator.valid? }

    it 'returns true' do
      is_expected.to be_truthy
    end

    context 'when owner looks like a group' do
      let(:data) { { '.' => '@gitlab-team' } }

      it 'returns true' do
        is_expected.to be_truthy
      end
    end

    context 'when owner is a group' do
      let(:data) { { '.' => '@timtams', 'source' => '@gl-product-leadership' } }

      it 'returns true' do
        is_expected.to be_truthy
      end
    end

    context 'when owner is not found' do
      let(:data) { { '.' => '@user1' } }

      it 'returns false' do
        is_expected.to be_falsey
      end

      it 'returns errors' do
        subject

        expect(validator.errors.count).to eq(1)
        expect(validator.errors.first).to include('Incorrect owner: @user1')
      end
    end
  end
end
