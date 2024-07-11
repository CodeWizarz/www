describe Gitlab::Homepage::Category do
  subject(:category) { described_class.new('epic', options) }

  let(:options) { { 'marketing' => marketing, 'maturity' => maturity } }
  let(:marketing) { true }
  let(:maturity) { 'planned' }

  describe '#marketing?' do
    subject { category.marketing? }

    it { is_expected.to be_truthy }

    context 'when marketing is false' do
      let(:marketing) { false }

      it { is_expected.to be_falsey }
    end
  end

  describe '#planned?' do
    subject { category.planned? }

    it { is_expected.to be_truthy }

    context 'when maturity is not planned' do
      let(:maturity) { 'viable' }

      it { is_expected.to be_falsey }
    end
  end

  describe '#unplanned?' do
    subject { category.unplanned? }

    context 'when known maturity is set' do
      let(:maturity) { 'minimal' }

      it { is_expected.to be_truthy }
    end

    context 'when maturity is planned' do
      let(:maturity) { 'planned' }

      it { is_expected.to be_falsey }
    end

    context 'when maturity is unknown' do
      let(:maturity) { 'unknown' }

      it { is_expected.to be_falsey }
    end
  end

  describe '#maturity_level' do
    subject { category.maturity_level }

    {
      'planned' => 0,
      'minimal' => 1,
      'viable' => 2,
      'complete' => 3,
      'lovable' => 4,
      'unknown' => nil
    }.each do |maturity, level|
      context maturity do
        let(:maturity) { maturity }

        it { is_expected.to eq(level) }
      end
    end
  end

  describe '#maturity_level_on_date' do
    subject { category.maturity_level_on_date(date) }

    let(:options) do
      {
        'lovable' => Date.new(2023, 1, 1),
        'complete' => Date.new(2022, 1, 1),
        'viable' => Date.new(2021, 1, 1),
        'available' => Date.new(2020, 1, 1)
      }
    end

    {
      Date.new(2019, 12, 31) => 0,
      Date.new(2020, 1, 1) => 1,
      Date.new(2021, 1, 1) => 2,
      Date.new(2022, 1, 1) => 3,
      Date.new(2023, 1, 1) => 4,
      Date.new(2023, 1, 2) => 4
    }.each do |date, level|
      context "on #{date}" do
        let(:date) { date }

        it { is_expected.to eq(level) }
      end
    end
  end

  describe '#available_before' do
    subject { category.available_before(requested_date) }
    let(:requested_date) { Date.new(2020, 1, 1) }
    let(:options) { { 'available' => available_date } }

    context 'when category available on requested date' do
      let(:available_date) { requested_date }

      it { is_expected.to be_truthy }
    end

    context 'when category available before requested date' do
      let(:available_date) { requested_date - 1.day }

      it { is_expected.to be_truthy }
    end

    context 'when category available after requested date' do
      let(:available_date) { requested_date + 1.day }

      it { is_expected.to be_falsey }
    end

    context 'when available_date is not set' do
      let(:available_date) { nil }

      it { is_expected.to be_falsey }
    end
  end

  describe '#available_after' do
    subject { category.available_after(requested_date) }
    let(:requested_date) { Date.new(2020, 1, 1) }
    let(:options) { { 'available' => available_date } }

    context 'when category available on requested date' do
      let(:available_date) { requested_date }

      it { is_expected.to be_falsey }
    end

    context 'when category available before requested date' do
      let(:available_date) { requested_date - 1.day }

      it { is_expected.to be_falsey }
    end

    context 'when category available after requested date' do
      let(:available_date) { requested_date + 1.day }

      it { is_expected.to be_truthy }
    end

    context 'when available_date is not set' do
      let(:available_date) { nil }

      it { is_expected.to be_falsey }
    end
  end

  describe '#label' do
    subject { category.label }
    let(:category_name) { 'Templates' }

    context 'when name is defined' do
      let(:options) { { 'name' => category_name } }

      it { is_expected.to eq("Category:#{category_name}") }
    end

    context 'when label is defined' do
      let(:label_name) { 'Category:Foobar' }
      let(:options) { { 'label' => label_name } }

      it { is_expected.to eq(label_name) }
    end
  end

  describe '#feature_labels' do
    subject { category.feature_labels }

    context 'when no feature_labels is defined' do
      it { is_expected.to eq([]) }
    end

    context 'when feature_labels is defined' do
      let(:feature_labels) { %w[foo bar] }
      let(:options) { { 'feature_labels' => feature_labels } }

      it { is_expected.to eq(feature_labels) }
    end
  end

  describe '#group' do
    let(:category) { described_class.new('system_access', { 'stage' => 'govern' }) }
    subject { category.group }

    it { is_expected.to eq('authentication') }

    context 'when category is not in any group' do
      let(:category) { described_class.new('foobar', { 'stage' => 'govern' }) }

      it { is_expected.to be_nil }
    end
  end
end
