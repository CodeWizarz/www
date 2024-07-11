require 'spec_helper'
require 'release_posts'

describe ReleasePosts::Builder do
  subject { described_class.new }

  describe '#fetch_release_branches' do
    before do
      branches = "origin/release-16-4 origin/release-16-5"
      allow(IO).to receive(:popen).with(['git', 'branch', '-r', '--list', 'origin/release-*']).and_return(branches)
    end

    it 'returns an array of branches' do
      branches_array = ["origin/release-16-4", "origin/release-16-5"]
      expect(subject.send(:fetch_release_branches)).to eq(branches_array)
    end
  end

  describe '#detect_next_release' do
    before do
      branches = "origin/release-16-4 origin/release-16-5"
      allow(IO).to receive(:popen).with(['git', 'branch', '-r', '--list', 'origin/release-*']).and_return(branches)
    end

    it 'returns the next release' do
      expect(subject.send(:detect_next_release)).to eq("release-16-5")
    end
  end

  describe '#auto_build' do
    let(:post) { instance_double(ReleasePosts::Post) }

    around(:example) do |example|
      example.run
    rescue SystemExit => e
      puts "Received SystemExit call: #{e.inspect}. Ignoring"
    end

    before(:example) do
      allow(ENV).to receive(:fetch).with('GITLAB_BOT_TOKEN').and_return('token')

      allow(IO).to receive(:popen).with(%w[git fetch]).and_return(nil)

      # mock fetch_release_branches git interaction
      branches = "origin/release-16-4 origin/release-16-5"
      allow(IO).to receive(:popen).with(['git', 'branch', '-r', '--list', 'origin/release-*']).and_return(branches)

      # mock git_config helper method
      allow(IO).to receive(:popen).with(['git', 'config', anything, anything]).and_return(nil)

      # mock git_change_branch helper method
      allow(IO).to receive(:popen).with(['git', 'checkout', anything]).and_return(nil)

      # mock git_merge helper method
      allow(IO).to receive(:popen).with(['git', 'merge', '--no-ff', '--no-edit', anything]).and_return(nil)

      # mock git_push helper method
      allow(IO).to receive(:popen).with(['git', 'push', "https://jobbot:token@gitlab.com/gitlab-com/www-gitlab-com.git", "HEAD:release-16-5"]).and_return(nil)

      # mock assembly process
      allow(ReleasePosts::Post).to receive(:new).and_return(post)
      allow(post).to receive(:assemble).and_return(nil)
    end

    context 'on the assembly date' do
      before(:context) do
        time = Time.local(2023, 9, 18, 0, 0, 0)
        Timecop.freeze(time)
      end

      after(:context) do
        Timecop.return
      end

      it 'does not exit early' do
        expect { subject.auto_build }.not_to raise_error
      end
    end

    context 'before the assembly date' do
      before(:context) do
        time = Time.local(2023, 9, 1, 0, 0, 0)
        Timecop.freeze(time)
      end

      after(:context) do
        Timecop.return
      end

      it 'exits early' do
        expect(subject.auto_build).to raise_error(SystemExit)
      end
    end
  end
end
