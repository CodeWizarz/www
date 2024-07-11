describe Gitlab::Homepage::Team::Assignment do
  subject(:assignment) { described_class.new(member, project, role) }
  let(:member) { double('member', load_domain_expertise: nil) }
  let(:project) { double('project') }
  let(:role) { 'maintainer backend' }

  describe '#responsibility' do
    subject { assignment.responsibility }

    it { is_expected.to eq 'maintainer' }
  end

  describe '#responsibility_label' do
    subject { assignment.responsibility_label }

    it { is_expected.to eq 'maintainer' }

    context 'when role is trainee_maintainer' do
      let(:role) { 'trainee_maintainer backend' }

      it { is_expected.to eq 'trainee maintainer' }
    end
  end

  describe '#responsibility_anchor' do
    subject { assignment.responsibility_anchor }

    it { is_expected.to eq 'maintainer' }

    context 'when role is trainee_maintainer' do
      let(:role) { 'trainee_maintainer backend' }

      it { is_expected.to eq 'trainee-maintainer' }
    end
  end

  describe '#description' do
    subject { assignment.description }

    it { is_expected.to eq 'backend' }
  end

  describe '#description?' do
    subject { assignment.description? }

    it { is_expected.to be_truthy }

    context 'when description is missing' do
      let(:role) { nil }

      it { is_expected.to be_falsey }
    end

    context 'when description is incorrect' do
      let(:role) { 'maintainer' }

      it { is_expected.to be_falsey }
    end
  end

  describe '#member' do
    subject { assignment.member }

    it { is_expected.to eq member }
  end

  describe '#project' do
    subject { assignment.project }

    it { is_expected.to eq project }
  end

  describe '#owner?' do
    subject { assignment.owner? }

    it { is_expected.to be_falsey }

    context 'when user is an owner' do
      let(:role) { 'owner' }

      it { is_expected.to be_truthy }
    end
  end

  describe '#maintainer?' do
    subject { assignment.maintainer? }

    it { is_expected.to be_truthy }

    context 'when user is not a maintainer' do
      let(:role) { nil }

      it { is_expected.to be_falsey }
    end
  end

  describe '#trainee_maintainer?' do
    subject { assignment.trainee_maintainer? }

    it { is_expected.to be_falsey }

    context 'when user is a trainee_maintainer' do
      let(:role) { 'trainee_maintainer' }

      it { is_expected.to be_truthy }
    end
  end

  describe '#reviewer?' do
    subject { assignment.reviewer? }

    it { is_expected.to be_falsey }

    context 'when user is a reviewer' do
      let(:role) { 'reviewer' }

      it { is_expected.to be_truthy }
    end
  end

  describe '#username' do
    subject { assignment.username }

    it 'delegates username to member' do
      expect(member).to receive(:username).once

      subject
    end
  end
end
