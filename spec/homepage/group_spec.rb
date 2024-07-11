describe Gitlab::Homepage::Group do
  subject(:group) { described_class.new(key, data) }
  let(:key) { 'source_code' }
  let(:categories) { %w[foo bar baz] }
  let(:data) do
    {
      'name' => 'Source Code',
      'categories' => categories
    }
  end

  describe '#method_missing' do
    it 'returns value by key' do
      expect(group.name).to eq('Source Code')
    end

    context 'when key is missing' do
      it { expect(group.unknown).to be_nil }
    end
  end

  describe '#categories' do
    subject { group.categories }

    it { is_expected.to eq(%w[foo bar baz]) }

    context 'when categories is nil' do
      let(:categories) { nil }

      it { is_expected.to eq([]) }
    end
  end

  describe '#label' do
    subject { group.label }

    context 'when name is defined' do
      it { is_expected.to eq("#{described_class::LABEL_PREFIX}source code") }
    end

    context 'when label is defined' do
      let(:label_name) { 'group:certify' }
      let(:data) { { 'label' => label_name } }

      it { is_expected.to eq(label_name) }
    end
  end

  describe '.all!' do
    subject { described_class.all! }

    before do
      allow(YAML).to receive(:load_file) do
        {
          'stages' => {
            'create' => { 'groups' => { 'source_code' => { 'name' => 'Source Code' } } },
            'plan' => { 'groups' => { 'project_management' => { 'name' => 'Project Management' } } }
          }
        }
      end
    end

    it 'returns Group objects' do
      group = subject

      expect(group.count).to eq(2)
      expect(group.map(&:name)).to match_array(['Source Code', 'Project Management'])
    end
  end
end
