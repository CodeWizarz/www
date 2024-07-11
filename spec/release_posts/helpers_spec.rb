require 'spec_helper'

describe ReleasePosts::Helpers do
  let(:klass) do
    Class.new do
      include ReleasePosts::Helpers
    end
  end

  subject(:helpers) { klass.new }

  describe '#fail_with' do
    subject { helpers.fail_with(message) }
    let(:message) { 'Message' }

    it 'raises Abort exception' do
      expect { subject }.to raise_error(ReleasePosts::Helpers::Abort, /Message/)
    end
  end

  describe '#git_add' do
    subject { helpers.git_add(src) }
    let(:src) { 'new_file' }

    it 'executes git add command' do
      expect_command(%w[git add new_file])
    end
  end

  describe '#git_config' do
    subject { helpers.git_config(key, value) }
    let(:key) { 'some_key' }
    let(:value) { 'some_value' }

    it 'executes git config command' do
      expect_command(%w[git config some_key some_value])
    end
  end

  describe '#git_fetch' do
    subject { helpers.git_fetch }

    it 'executes git fetch command' do
      expect_command(%w[git fetch])
    end
  end

  describe '#git_merge' do
    subject { helpers.git_merge(branch) }
    let(:branch) { 'new_branch' }

    it 'executes git merge command' do
      expect_command(%w[git merge --no-ff --no-edit new_branch])
    end
  end

  describe '#git_commit' do
    subject { helpers.git_commit(message) }
    let(:message) { 'commit_message' }

    it 'executes git commit command' do
      expect_command(%w[git commit --message commit_message])
    end
  end

  describe '#git_push' do
    subject { helpers.git_push(path, branch) }
    let(:path) { 'https://gitlab.com/repository.git' }
    let(:branch) { 'new_branch' }

    it 'executes git push command' do
      expect_command(%w[git push https://gitlab.com/repository.git HEAD:new_branch])
    end
  end

  describe '#git_mv' do
    subject { helpers.git_mv(src, dst) }
    let(:src) { 'old_file' }
    let(:dst) { 'new_file' }

    it 'executes git mv command' do
      expect_command(%w[git mv old_file new_file])
    end
  end

  describe '#git_change_branch' do
    subject { helpers.git_change_branch(branch) }
    let(:branch) { 'new_branch' }

    it 'executes git checkout command' do
      expect_command(%w[git checkout new_branch])
    end
  end

  describe '#git_branch_list' do
    subject { helpers.git_branch_list(pattern) }
    let(:pattern) { 'release*' }

    it 'executes git branch command' do
      expect_command(%w[git branch -r --list release*])
    end
  end

  private

  def expect_command(cmd)
    expect(IO).to receive(:popen).with(cmd)
    subject
  end
end
