require 'spec_helper'

describe Gitlab::CodeOwners do
  describe '.load_codeowners_file' do
    subject { described_class.load_codeowners_file(root) }

    context 'when file exists' do
      let(:root) { '.' }

      before do
        allow(::File).to receive(:exist?) { true }
        allow(::File).to receive(:read) { 'content' }
      end

      it 'returns CodeOwners::File' do
        is_expected.to be_a(Gitlab::CodeOwners::File)
      end
    end

    context 'when file is missing' do
      let(:root) { 'unknown' }

      before do
        allow(::File).to receive(:exist?) { false }
      end

      it 'raises an exception' do
        expect { subject }.to raise_error('CODEOWNERS file is missing')
      end
    end
  end

  describe '.codeowners_for_page' do
    subject { described_class.codeowners_for_page(page) }
    let(:page) { double('Page', source_file: '/root/sites/handbook/index.html') }

    before do
      allow(::File).to receive(:expand_path) { '/root' }
      allow(::File).to receive(:exist?) { true }
      allow(::File).to receive(:read) { "/sites/handbook/ @sytses\n" }
    end

    it { is_expected.to eq(['@sytses']) }
  end

  describe '.validate' do
    subject { described_class.validate(data) }

    let(:data) { {} }

    it 'returns a successful result' do
      is_expected.to eq(success: true, errors: {})
    end

    context 'when codeowners file contain errors' do
      let(:data) { { 'wrong_path' => '@user' } }

      it 'returns errors' do
        is_expected.to include(success: false, errors: kind_of(Hash))
      end
    end
  end
end
