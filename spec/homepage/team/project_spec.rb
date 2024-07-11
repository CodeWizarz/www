describe Gitlab::Homepage::Team::Project do
  subject(:project) { described_class.new(key, data) }
  let(:key) { 'gitlab' }
  let(:data) { { 'name' => 'GitLab' } }

  describe '.all!' do
    subject { described_class.all! }

    it 'correctly integrates with data/projects.yml' do
      expect(subject).not_to be_empty
      expect(subject).to all(be_a described_class)

      expect(subject.first.name).to eq 'GitLab'
    end
  end

  %w[name description link path].each do |method|
    describe "##{method}" do
      subject { project.public_send(method) }

      context "when #{method} is present" do
        let(:data) { { method => 'value' } }

        it { is_expected.to eq 'value' }
      end

      context "when #{method} is missing" do
        let(:data) { {} }

        it { expect { subject }.to raise_error(KeyError) }
      end
    end
  end

  describe '#mirrors' do
    subject { project.mirrors }

    context 'when project has mirrors' do
      let(:data) { { 'mirrors' => %w[mirror] } }

      it 'returns an array' do
        is_expected.to eq(['mirror'])
      end
    end

    context 'when project does not have mirrors' do
      let(:data) { {} }

      it 'returns an empty array' do
        is_expected.to be_empty
      end
    end
  end

  describe '#assign' do
    subject { project.assign(member) }
    let(:member) { double('Member', project_roles: { 'gitlab' => ['maintainer'] }, load_domain_expertise: nil) }

    it 'creates a new team assignment' do
      subject

      expect(project.assignments.count).to eq 1
      expect(project.assignments.first).to be_maintainer
    end
  end

  %w[owners trainee_maintainers maintainers reviewers].each do |method|
    describe "##{method}" do
      subject { project.public_send(method) }

      let(:member_1) { double('Member', username: 'Ben', project_roles: { 'gitlab' => [method.singularize] }, load_domain_expertise: nil) }
      let(:member_2) { double('Member', username: 'Alex', project_roles: { 'gitlab' => [method.singularize] }, load_domain_expertise: nil) }
      let(:member_3) { double('Member', username: 'Chase', project_roles: { 'gitlab' => ['other'] }, load_domain_expertise: nil) }

      before do
        [member_1, member_2, member_3].each { |member| project.assign(member) }
      end

      it "returns #{method} of the project sorted in an alphabetical order" do
        expect(subject.map(&:username)).to eq(%w[Alex Ben])
      end
    end
  end
end
