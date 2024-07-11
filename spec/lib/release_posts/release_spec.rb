require 'spec_helper'
require 'release_posts'
require 'yaml'

describe ReleasePosts::Release do
  subject { described_class.new }

  describe 'RELEASES_FILE' do
    it 'is a string' do
      expect(ReleasePosts::Release::RELEASES_FILE).to be_a String
    end

    it 'includes releases.yml' do
      expect(ReleasePosts::Release::RELEASES_FILE).to include 'releases.yml'
    end

    it 'is a valid yaml file' do
      expect(YAML.parse(File.open(ReleasePosts::Release::RELEASES_FILE))).to be_truthy
    end
  end

  describe '#current' do
    before(:context) do
      time = Time.local(2023, 9, 1, 0, 0, 0)
      Timecop.freeze(time)
    end

    after(:context) do
      Timecop.return
    end

    it 'returns the current release relative to the current month' do
      expect(subject.current['version']).to eq('16.4')
    end
  end

  describe 'self.current' do
    subject { described_class.current }

    before(:context) do
      time = Time.local(2023, 9, 1, 0, 0, 0)
      Timecop.freeze(time)
    end

    after(:context) do
      Timecop.return
    end

    it 'returns the current release relative to the current month' do
      expect(subject['version']).to eq('16.4')
    end
  end

  describe "#assembly_date?" do
    # model 16.4 with a release date of 2023-09-22

    context "5 days before the release" do
      before(:context) do
        time = Time.local(2023, 9, 17, 0, 0, 0)
        Timecop.freeze(time)
      end

      after(:context) do
        Timecop.return
      end

      it "returns false" do
        expect(described_class.send(:assembly_date?)).to eq(false)
      end
    end

    context "4 days before the release" do
      before(:context) do
        time = Time.local(2023, 9, 18, 0, 0, 0)
        Timecop.freeze(time)
      end

      after(:context) do
        Timecop.return
      end

      it "returns true" do
        expect(described_class.send(:assembly_date?)).to eq(true)
      end
    end

    context "3 days before the release" do
      before(:context) do
        time = Time.local(2023, 9, 19, 0, 0, 0)
        Timecop.freeze(time)
      end

      after(:context) do
        Timecop.return
      end

      it "returns false" do
        expect(described_class.send(:assembly_date?)).to eq(false)
      end
    end

    context "1 day after the release" do
      before(:context) do
        time = Time.local(2023, 9, 23, 0, 0, 0)
        Timecop.freeze(time)
      end

      after(:context) do
        Timecop.return
      end

      it "returns false" do
        expect(described_class.send(:assembly_date?)).to eq(false)
      end
    end
  end
end
