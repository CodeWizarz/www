require 'spec_helper'

describe Gitlab::CodeOwners::File do
  subject(:file) { described_class.new(content) }
  let(:content) { File.read(File.join('spec', 'fixtures', 'codeowners_example')) }

  describe '#owners_for_path' do
    subject { file.owners_for_path(path) }

    context 'when there are no matches' do
      let(:path) { 'source/handbook' }
      let(:content) { '# just an empty content' }

      it 'returns no owners' do
        is_expected.to eq([])
      end
    end

    context 'when file path is unknown' do
      let(:path) { 'source/handbook/random_page.md' }

      it 'returns a default owner' do
        is_expected.to eq(['@default-codeowner'])
      end
    end

    context 'when multiple patterns match' do
      let(:path) { 'hello.rb' }

      it 'uses the last pattern' do
        is_expected.to eq(['@ruby-owner'])
      end
    end

    context 'when a file matching a pattern with a glob' do
      let(:path) { 'app/models/repository.rb' }

      it 'returns users' do
        is_expected.to eq(['@ruby-owner'])
      end
    end

    context 'when multiple users are specified' do
      let(:path) { 'CODEOWNERS' }

      it 'returns all of them' do
        is_expected.to match_array(['@multiple', '@owners', '@tab-separated'])
      end
    end

    context 'when code owner is an email' do
      let(:path) { 'LICENSE' }

      it 'returns Gitlab users and emails' do
        is_expected.to match_array(['@legal', 'janedoe@gitlab.com'])
      end
    end

    context 'when file has the pound sign' do
      let(:path) { 'examples/#file_with_pound.rb' }

      it 'still finds the correct owner' do
        is_expected.to eq(['@owner-file-with-pound'])
      end
    end

    context 'when file nested in a directory' do
      let(:path) { 'docs/projects/index.md' }

      it 'returns the usernames' do
        is_expected.to eq(['@all-docs'])
      end
    end

    context 'when pattern matched with a glob in a folder' do
      let(:path) { 'docs/index.md' }

      it 'returns the usernames' do
        is_expected.to eq(['@root-docs'])
      end
    end

    context 'when matching nested files' do
      let(:path) { 'lib/gitlab/git/repository.rb' }

      it 'returns correct code owner' do
        is_expected.to eq(['@lib-owner'])
      end

      context 'when lib folder is nested' do
        let(:path) { 'ee/lib/gitlab/git/repository.rb' }

        it 'returns correct code owner' do
          is_expected.to eq(['@lib-owner'])
        end
      end
    end

    context 'when matching nested files is limited' do
      let(:path) { 'config/database.yml' }

      it 'returns correct code owner' do
        is_expected.to eq(['@config-owner'])
      end

      context 'when config folder is nested' do
        let(:path) { 'other/config/database.yml' }

        it 'returns default code owner' do
          is_expected.to eq(['@default-codeowner'])
        end
      end
    end

    context 'when path has spaces' do
      let(:path) { 'path with spaces/README.md' }

      it 'correctly matches it' do
        is_expected.to eq(['@space-owner'])
      end
    end

    context 'when paths with whitespaces and username lookalikes' do
      let(:content) do
        'a/weird\ path\ with/\ @username\ /\ and-email@lookalikes.com\ / @user-1 email@gitlab.org @user-2'
      end
      let(:path) { 'a/weird path with/ @username / and-email@lookalikes.com /test.rb' }

      it 'parses correctly' do
        is_expected.to match_array(['@user-1', '@user-2', 'email@gitlab.org'])
      end
    end
  end
end
