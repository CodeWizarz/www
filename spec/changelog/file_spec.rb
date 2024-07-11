require 'spec_helper'

describe Changelog::File do
  subject(:file) { described_class.new(path) }
  let(:path) { '/tmp/changelog' }

  describe '.create' do
    subject { described_class.create(path) }
    let(:instance) { instance_double(described_class) }

    it 'initializes an instance and calls #write!' do
      allow(described_class).to receive(:new).with(path) { instance }
      expect(instance).to receive(:write!)

      subject
    end
  end

  describe '#write!' do
    subject { file.write! }

    before do
      allow(Gitlab).to receive(:merge_requests) { double(auto_paginate: []) }
    end

    it 'creates a file for provided path with MR content' do
      expect(File).to receive(:write) do |path, content|
        expect(path).to eq(path)
        expect(content).to include('layout: markdown_page')
      end

      subject
    end
  end
end
