describe Gitlab::Homepage::Stage do
  subject(:stage) { described_class.new(key, data) }
  let(:key) { 'manage' }
  let(:data) do
    {
      'display_name' => 'Manage',
      'groups' => {
        'access' => {},
        'import' => {}
      }
    }
  end

  describe '#method_missing' do
    it 'returns value by key' do
      expect(stage.display_name).to eq('Manage')
    end

    context 'when key is missing' do
      it { expect(stage.unknown).to be_nil }
    end
  end

  describe '#groups' do
    subject { stage.groups }

    it 'makes a call to Category#for_stage' do
      expect(subject).to eq(%w[access import])
    end
  end

  describe '#categories' do
    subject { stage.categories }

    it 'makes a call to Category#for_stage' do
      expect(Gitlab::Homepage::Category).to receive(:for_stage).with(stage)

      subject
    end
  end

  describe '#label' do
    subject { stage.label }

    it { is_expected.to eq("#{described_class::LABEL_PREFIX}#{key}") }
  end

  describe '.all!' do
    subject { described_class.all! }

    before do
      allow(YAML).to receive(:load_file) do
        {
          'stages' => {
            'manage' => { 'display_name' => 'Manage' },
            'plan' => { 'display_name' => 'Plan' }
          }
        }
      end
    end

    it 'returns Stage objects' do
      stage = subject

      expect(stage.count).to eq(2)
      expect(stage.map(&:display_name)).to match_array(%w[Manage Plan])
    end
  end
end
