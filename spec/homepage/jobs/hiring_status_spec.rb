# frozen_string_literal: true

describe Gitlab::Homepage::Jobs::HiringStatus do
  subject(:hiring_status) { described_class.new(data) }

  describe '#under_sanction?' do
    subject { hiring_status.under_sanction? }

    context 'when sanction: true' do
      let(:data) { { 'sanction' => true } }

      it { is_expected.to be_truthy }
    end

    context 'when sanction: false' do
      let(:data) { { 'sanction' => false } }

      it { is_expected.to be_falsey }
    end

    context 'when sanction is missing' do
      let(:data) { {} }

      it { is_expected.to be_falsey }
    end
  end

  describe '#hiring?' do
    subject { hiring_status.hiring? }

    context 'when hiring: true' do
      let(:data) { { 'hiring' => true } }

      it { is_expected.to be_truthy }
    end

    context 'when hiring: false' do
      let(:data) { { 'hiring' => false } }

      it { is_expected.to be_falsey }
    end

    context 'when hiring is missing' do
      context 'when sanction: true' do
        let(:data) { { 'sanction' => true } }

        it { is_expected.to be_falsey }
      end

      context 'when sanction: false' do
        let(:data) { { 'sanction' => false } }

        it { is_expected.to be_truthy }
      end
    end
  end

  describe '#hiring_limit' do
    subject { hiring_status.hiring_limit }

    context 'when hiring limit defined' do
      let(:data) { { 'hiring_limit' => 10 } }

      it { is_expected.to eq(10) }
    end

    context 'when hiring limit is false' do
      let(:data) { { 'hiring_limit' => false } }

      it { is_expected.to eq('no limit') }
    end

    context 'when under sanction' do
      let(:data) { { 'sanction' => true } }

      it { is_expected.to eq('WIP') }
    end
  end

  describe '#explanation' do
    subject { hiring_status.explanation }

    context 'when explanation is defined' do
      let(:data) { { 'explanation' => 'Reason' } }

      it { is_expected.to eq('Reason') }
    end

    context 'when explanation is missing' do
      let(:data) { {} }

      it { is_expected.to be_nil }
    end
  end

  describe '#[]' do
    subject { hiring_status[key] }
    let(:key) { 'key' }

    context 'when key matches key from data' do
      let(:data) { { 'key' => 'value' } }

      it { is_expected.to eq('value') }
    end

    context 'when there is no match' do
      let(:data) { {} }

      it { is_expected.to be_nil }
    end
  end

  describe '.raw_data' do
    subject { described_class.raw_data }

    before do
      allow(YAML).to receive(:load_file).with(%r{data/country_hiring_status.yml}) { 'content' }
    end

    it { is_expected.to eq('content') }
  end

  describe '.all!' do
    subject { described_class.all! }

    before do
      allow(described_class).to receive(:raw_data) { [{ 'country' => 'US', 'sanction' => false }] }
    end

    it 'returns a HiringStatus collection' do
      expect(subject.size).to eq(1)
      expect(subject.first['country']).to eq('US')
      expect(subject.first['sanction']).to eq(false)
    end
  end

  describe 'Query methods' do
    before do
      example_data = [
        { 'country' => 'Tropico', 'sanction' => true },
        { 'country' => 'SimNation', 'hiring_limit' => false, 'peo_entity' => 'SafeGuard' },
        { 'country' => 'Azeroth', 'hiring' => false, 'gitlab_entity' => 'GitLab BV' }
      ]

      allow(described_class).to receive(:raw_data).and_return(example_data)
    end

    let(:fetched_countries) { subject.map { |hs| hs['country'] } }

    describe '.under_sanctions' do
      subject { described_class.under_sanctions }

      it 'return countries under sanction and where we cannot hire' do
        expect(fetched_countries).to match_array(['Tropico'])
      end
    end

    describe '.no_hiring_list' do
      subject { described_class.no_hiring_list }

      it 'return countries under sanction and where we cannot hire' do
        expect(fetched_countries).to match_array(%w[Tropico Azeroth])
      end
    end

    describe '.hireables' do
      subject { described_class.hireables }

      it 'return countries not under sanctions' do
        expect(fetched_countries).to match_array(%w[SimNation Azeroth])
      end
    end

    describe '.with_peo_entities' do
      subject { described_class.with_peo_entities }

      it 'return countries with peo entities defined' do
        expect(fetched_countries).to match_array(['SimNation'])
      end
    end

    describe '.with_gitlab_entities' do
      subject { described_class.with_gitlab_entities }

      it 'return countries with gitlab entities' do
        expect(fetched_countries).to match_array(['Azeroth'])
      end
    end
  end
end
