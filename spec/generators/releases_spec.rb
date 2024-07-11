require_relative '../../generators/releases'

describe ReleaseList do
  describe '#generate' do
    context 'when no release is present' do
      it 'should return an empty string when no files are present' do
        list = ReleaseList.new(location: '.')
        expect(list.generate).to eq('')
      end

      it 'should return an empty string when files dont match the regular expression' do
        list = ReleaseList.new(location: '../spec/fixtures/generators/releases/files_dont_match_regular_expression')
        expect(list.generate).to eq('')
      end

      it 'should return an empty string when a file is before the cut-off date' do
        list = ReleaseList.new(location: '../spec/fixtures/generators/releases/files_are_before_cut_off')
        expect(list.generate).to eq('')
      end
    end

    context 'when valid releases are present with a data dir' do
      let(:list) do
        ReleaseList.new(
          location: '../spec/fixtures/generators/releases/single_release',
          data_dir_location: '../spec/fixtures/generators/releases/single_release/data'
        )
      end

      it 'should contain the release number' do
        output = list.generate
        expect(output).not_to eq('')
        expect(output).to include('GitLab 15.2')
      end

      it 'should contain the tier headers' do
        output = list.generate
        expect(output).not_to eq('')
        expect(output).to include('### Core')
        expect(output).to include('### Premium')
        expect(output).to include('### Ultimate')
      end

      it 'should pull the right highlights per stage from the data dir' do
        expect(list.generate).to include('Updated cluster version support, including Kubernetes 1.23 and 1.24')
      end

      it 'should associate the highlights to the right section' do
        expect(list.generate).to match(/###\sCore(.|\n)+?Verify(.|\n)+Updated\scluster\sversion\ssupport/)
      end
    end

    context 'when valid releases are present with a data file' do
      let(:list) do
        ReleaseList.new(
          location: '../spec/fixtures/generators/releases/data_file',
          data_dir_location: '../spec/fixtures/generators/releases/data_file/data'
        )
      end

      it 'should be able to read highlights from a data file' do
        expect(list.generate).to include('Parent-Child Pipelines')
      end
    end
  end

  describe '#count' do
    it 'should return the total CUTOFF amount when posts are not present' do
      list = ReleaseList.new(location: '.')
      expect(list.count).to eq(ReleaseList::RELEASES_BEFORE_CUTOFF)
    end

    it 'should return the total count of posts when posts are present' do
      list = ReleaseList.new(location: '../spec/fixtures/generators/releases/single_release')
      expect(list.count).to eq(ReleaseList::RELEASES_BEFORE_CUTOFF + 1)
    end
  end
end
