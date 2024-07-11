require 'spec_helper'

describe Gitlab::CodeOwners::PathValidator do
  subject(:validator) { described_class.new(data) }
  let(:data) { { '*.rb' => '@user', '/source/' => '@user' } }

  describe '#valid?' do
    subject { validator.valid? }

    it 'returns true' do
      is_expected.to be_truthy
    end

    context 'when path is not found' do
      let(:data) { { '__not_found__' => '@user' } }

      it 'returns false' do
        is_expected.to be_falsey
      end

      it 'returns errors' do
        subject

        expect(validator.errors.count).to eq(1)
        expect(validator.errors.first).to include('Missing path: __not_found__')
      end
    end

    context 'when path has incorrect format' do
      let(:data) { { '/source' => '@user' } }

      it 'returns false' do
        is_expected.to be_falsey
      end

      it 'returns errors' do
        subject

        expect(validator.errors.count).to eq(1)
        expect(validator.errors.first).to include('Use `/source/` instead of `/source`')
      end
    end
  end
end
