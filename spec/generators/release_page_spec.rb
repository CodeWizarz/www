require_relative '../../generators/release_page'

describe ReleasePage do
  let(:release_page) { described_class.new }
  let(:releases_file) { File.join('spec', 'fixtures', 'generators', 'releases', 'releases.yml') }

  before do
    Timecop.freeze(Time.local(2024, 2, 15))

    allow(release_page).to receive(:releases_file).and_return(releases_file)
  end

  after do
    Timecop.return
  end

  describe '#releases_count' do
    let(:release_list) { instance_double(ReleaseList, count: 9) }

    it 'returns the count' do
      allow(ReleaseList).to receive(:new).and_return(release_list)
      expect(release_page.releases_count).to eq(9)
    end
  end

  describe '#releases_data' do
    it 'returns a hash of releases' do
      expected_output = {
        historic_releases: [
          { 'version' => '16.7', 'date' => '2023-12-21' },
          { 'version' => '16.6', 'date' => '2023-11-16' }
        ],
        upcoming_releases: [
          { 'version' => '17.2', 'date' => '2024-07-18' },
          { 'version' => '17.1', 'date' => '2024-06-20' },
          { 'version' => '17.0', 'date' => '2024-05-16' },
          { 'version' => '16.11', 'date' => '2024-04-18' },
          { 'version' => '16.10', 'date' => '2024-03-21' },
          { 'version' => '16.9', 'date' => '2024-02-15' },
          { 'version' => '16.8', 'date' => '2024-01-18' }
        ]
      }

      expect(release_page.releases_data).to eq(expected_output)
    end
  end

  describe '#current_version' do
    it 'returns the version closest to the current date' do
      expect(release_page.current_version).to eq({ 'version' => '16.8', 'date' => '2024-01-18' })
    end
  end

  describe '#active_version' do
    it 'returns closest version beyond the current date' do
      expect(release_page.active_version).to eq({ 'version' => '16.9', 'date' => '2024-02-15' })
    end
  end
end
