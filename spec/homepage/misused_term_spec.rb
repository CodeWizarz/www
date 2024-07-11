describe Gitlab::Homepage::MisusedTerm do
  subject(:misused_term) { described_class.new(data) }
  let(:data) do
    {
      'avoid' => avoid,
      'use_instead' => use_instead,
      'reason' => reason,
      'avoid_footnote' => avoid_footnote
    }
  end
  let(:avoid) { 'GitLabber' }
  let(:use_instead) { 'GitLab team member' }
  let(:reason) { 'Reason' }
  let(:avoid_footnote) { 'Footnote' }

  describe '#id' do
    subject { misused_term.id }

    it { is_expected.to eq(:gitlabber) }

    context 'when avoid is a phrase' do
      let(:avoid) { "Poor man's solution" }

      it { is_expected.to eq(:poor_mans_solution) }
    end

    context 'when avoid is an array' do
      let(:avoid) { %w[Biweekly Bimonthly] }

      it { is_expected.to eq(:biweekly) }
    end
  end

  describe '#avoid' do
    subject { misused_term.avoid }

    it { is_expected.to eq(['GitLabber']) }

    context 'when avoid is an array' do
      let(:avoid) { %w[Biweekly Bimonthly] }

      it { is_expected.to match_array(%w[Biweekly Bimonthly]) }
    end
  end

  describe '#use_instead' do
    subject { misused_term.use_instead }

    it { is_expected.to eq(['GitLab team member']) }

    context 'when use_instead is an array' do
      let(:use_instead) { ['Twice', 'Every two'] }

      it { is_expected.to match_array(['Twice', 'Every two']) }
    end
  end

  describe '#method_missing' do
    context 'reason' do
      subject { misused_term.reason }

      it { is_expected.to eq('Reason') }
    end

    context 'avoid_footnote' do
      subject { misused_term.avoid_footnote }

      it { is_expected.to eq('Footnote') }
    end

    context 'unknown' do
      subject { misused_term.unknown }

      it { is_expected.to be_nil }
    end
  end

  describe '.all!' do
    subject { described_class.all! }

    before do
      described_class.instance_variable_set(:@misused_terms, nil)
      allow(YAML).to receive(:load_file) { [data] }
    end

    it { expect(subject.count).to eq(1) }

    it 'returns MisusedTerm objects' do
      misused_term = subject.first

      expect(misused_term).to be_kind_of(described_class)
    end
  end

  describe '.excluded_from_export' do
    subject { described_class.excluded_from_export }

    let(:data) do
      [
        { 'avoid' => ['Term 1', 'Term 2'] },
        { 'avoid' => 'Term 3' },
        { 'avoid' => 'Term 4', 'exclude_from_exports' => true }
      ]
    end

    before do
      described_class.instance_variable_set(:@misused_terms, nil)
      allow(YAML).to receive(:load_file) { data }
    end

    it 'returns a comma-separated list of avoided terms' do
      is_expected.to eq('Term 1, Term 2, Term 3')
    end
  end
end
