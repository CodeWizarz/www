describe Gitlab::Homepage::Feature do
  subject(:feature) { described_class.new(data) }
  let(:data) do
    {
      'title' => title,
      'screenshot_url' => screenshot_url
    }
  end
  let(:title) { 'CI/CD' }
  let(:screenshot_url) { 'screen.png' }

  describe '#[]' do
    it 'returns feature data by key' do
      expect(feature['title']).to eq(title)
    end

    context 'when key is missing' do
      it { expect(feature['unknown']).to be_nil }
    end
  end

  describe '#method_missing' do
    it 'returns value by key' do
      expect(feature.title).to eq(title)
    end

    context 'when key is missing' do
      it { expect(feature.unknown).to be_nil }
    end
  end

  describe '#missing?' do
    subject { feature.missing? }

    context 'when feature is not implemented' do
      let(:data) { super().merge('gitlab_core' => false, 'gitlab_premium' => false) }

      it { is_expected.to be_truthy }
    end

    context 'when feature present in one of tiers' do
      let(:data) { super().merge('gitlab_core' => false, 'gitlab_premium' => true) }

      it { is_expected.to be_falsey }
    end
  end

  describe '#screenshot?' do
    subject { feature.screenshot? }

    context 'when screenshot_url is present' do
      it { is_expected.to be_truthy }
    end

    context 'when screenshot_url is empty' do
      let(:screenshot_url) { nil }

      it { is_expected.to be_falsey }
    end
  end

  describe '.all!' do
    subject { described_class.all! }

    before do
      allow(YAML).to receive(:load_file) do
        {
          'features' => [
            { 'title' => 'Feature 1' },
            { 'title' => 'Feature 2' }
          ]
        }
      end
    end

    it 'returns Feature objects' do
      features = subject

      expect(features.count).to eq(2)
      expect(features.map(&:title)).to match_array(['Feature 1', 'Feature 2'])
    end
  end
end
