require 'career_matrix'

describe Gitlab::Homepage::CareerMatrix do
  let(:matrix) { described_class.engineering_ic }

  describe '#levels' do
    subject { matrix.levels }

    it { is_expected.to include('Intermediate', 'Senior') }
  end

  describe '#categories' do
    subject { matrix.categories }

    it { is_expected.to include('Values Alignment', 'Technical Competencies') }
  end

  describe '#behaviours_for' do
    subject { matrix.behaviours_for('Values Alignment') }

    it { is_expected.to include('Collaboration', 'Results') }
  end

  describe '#descriptions_for' do
    subject { matrix.descriptions_for('Intermediate', 'Values Alignment', 'Collaboration') }

    it { is_expected.to include(/Independently brings/, /Gives positive feedback/) }
  end

  describe '#as_csv' do
    subject { matrix.as_csv }

    it { is_expected.to match(/Behaviours,Intermediate,Senior/) }
    it { is_expected.to match(/Values Alignment: Collaboration,.*Independently.*\n.*Gives.*Engages/) }
    it { is_expected.to match(/Values Alignment: Results/) }
  end
end
