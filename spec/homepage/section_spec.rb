describe Gitlab::Homepage::Section do
  subject(:section) { described_class.new(key, data) }
  let(:key) { 'dev' }
  let(:data) do
    {
      'name' => 'Dev'
    }
  end

  describe '#method_missing' do
    it 'returns value by key' do
      expect(section.name).to eq(data['name'])
    end

    context 'when key is missing' do
      it { expect(section.unknown).to be_nil }
    end
  end

  describe '#label' do
    subject { section.label }

    it { is_expected.to eq("#{described_class::LABEL_PREFIX}#{key}") }
  end

  describe '.all!' do
    subject { described_class.all! }

    before do
      allow(YAML).to receive(:load_file) do
        {
          'dev' => { 'name' => 'Dev' },
          'ops' => { 'name' => 'Ops' }
        }
      end
    end

    it 'returns Section objects' do
      section = subject

      expect(section.count).to eq(2)
      expect(section.map(&:name)).to match_array(%w[Dev Ops])
    end
  end
end
