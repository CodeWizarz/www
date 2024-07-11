describe Gitlab::Homepage::Team::Member do
  subject(:member) { described_class.new(data) }
  let(:data) do
    {
      'start_date' => Date.new(2020, 1, 1)
    }
  end

  describe '.normalize_country' do
    subject { described_class.normalize_country(country) }

    context 'when country is USA' do
      let(:country) { 'USA' }

      it { is_expected.to eq 'United States' }
    end

    context 'when country is Ukraine' do
      let(:country) { 'Ukraine' }

      it { is_expected.to eq 'Ukraine' }
    end
  end

  describe '.all!' do
    subject { described_class.all! }

    let(:sid) { subject.find { |member| member.username == 'sytses' } }

    it 'correctly integrates with data/team_members entry' do
      expect(subject).not_to be_empty
      expect(subject).to all(be_a described_class)

      expect(sid).to be_present
    end

    it 'correctly loads report titles' do
      expect(sid.reports_to_title).to match('Lead Independent Director')
    end

    it 'sorts live team data without errors' do
      expect { subject.sort }.not_to raise_error
    end
  end

  describe '.no_vacancies' do
    subject { described_class.no_vacancies }

    it 'removes open positions' do
      is_expected.to be
      expect(subject.size).to be <= described_class.all!.length
    end
  end

  describe '#==' do
    it 'returns true if both slugs match' do
      member_a = described_class.new('slug' => 'a')
      member_a_two = described_class.new('slug' => 'a')

      expect(member_a).to eq(member_a_two)
    end

    it 'returns false when slugs do not match' do
      member_a = described_class.new('slug' => 'a')
      member_b = described_class.new('slug' => 'b')

      expect(member_a).not_to eq(member_b)
    end
  end

  describe '#hash' do
    it 'returns the slug' do
      member_a = described_class.new('slug' => 'a')
      member_a_two = described_class.new('slug' => 'a')
      member_b = described_class.new('slug' => 'b')

      expect([member_a, member_b] - [member_a_two]).to eq([member_b])
    end
  end

  describe '#anchor' do
    subject { member.anchor }

    let(:data) { { 'gitlab' => gitlab, 'slug' => slug } }
    let(:gitlab) { 'user' }
    let(:slug) { 'us' }

    it 'returns gitlab handle' do
      is_expected.to eq(gitlab)
    end

    context 'when gitlab name is missing' do
      let(:gitlab) { nil }

      it 'returns slug' do
        is_expected.to eq(slug)
      end
    end

    context 'when both gitlab and slug are missing' do
      let(:data) { {} }

      it { is_expected.to be_nil }
    end
  end

  describe '#username' do
    subject { member.username }

    let(:data) { { 'gitlab' => gitlab } }
    let(:gitlab) { 'user' }

    it 'returns gitlab handle' do
      is_expected.to eq(gitlab)
    end

    context 'when gitlab name is not set' do
      let(:gitlab) { nil }

      it { is_expected.to be_nil }
    end
  end

  describe '#involved?' do
    subject { member.involved?(project) }
    let(:data) { { 'projects' => { 'gitlab' => ['maintainer backend', 'owner'] } } }

    context 'when user is involved in the project' do
      let(:project) { double(key: 'gitlab') }

      it 'indicates that user is involved in the project' do
        is_expected.to be true
      end
    end

    context 'when user is not involved in the project' do
      let(:project) { double(key: 'gitlab-foss') }

      it 'indicates that user is not involved in the project' do
        is_expected.to be false
      end
    end
  end

  describe '#text_role' do
    subject { member.text_role }

    let(:data) { { 'username' => 'grzesiek', 'role' => '<a href="/job-families/engineering/developer/">Senior Developer, <strong>Verify (CI)</strong></a>' } }

    it 'returns the role with HTML tags stripped' do
      is_expected.to eq('Senior Developer, Verify (CI)')
    end
  end

  describe '#project_roles' do
    subject { member.project_roles }

    context 'when user has only one role in the project' do
      let(:data) { { 'projects' => { 'gitlab' => 'maintainer backend' } } }

      it 'returns an inverted project role hash' do
        is_expected.to eq('gitlab' => ['maintainer backend'])
      end
    end

    context 'when user has multiple roles in the project' do
      let(:data) { { 'projects' => { 'gitlab' => ['maintainer backend', 'owner'] } } }

      it 'returns an inverted project role hash' do
        is_expected.to eq('gitlab' => ['maintainer backend', 'owner'])
      end
    end
  end

  describe '#assign' do
    subject { member.assign(project) }
    let(:project) { Gitlab::Homepage::Team::Project.new('gitlab', name: 'GitLab') }
    let(:data) { { 'username' => 'grzesiek', 'projects' => { 'gitlab' => 'reviewer' } } }

    it 'creates a new project assignment' do
      subject

      expect(member.assignments.count).to eq 1
      expect(member.assignments.first).to be_reviewer
    end
  end

  describe '#departments' do
    subject { member.departments }

    let(:data) { { 'departments' => ['Engineering Function', 'Dev Section'] } }

    it 'returns a list of departments for member' do
      is_expected.to match_array(['Engineering Function', 'Dev Section'])
    end
  end

  describe '#country_normalized' do
    subject { member.country_normalized }
    let(:data) { { 'country' => 'US' } }

    it 'makes a proxy call to .normalize_country' do
      expect(described_class).to receive(:normalize_country).with('US')

      subject
    end
  end

  describe '#country_info' do
    subject { member.country_info }
    let(:data) { { 'country' => 'US' } }

    it 'returns country info for a member' do
      is_expected.to be_a(ISO3166::Country)
    end
  end

  describe '#vacancy_for_sort' do
    subject { member.vacancy_for_sort }

    context 'when the member is a vacancy' do
      let(:data) { { 'type' => 'vacancy' } }

      it { is_expected.to eq(1) }
    end

    context 'when the member is not a vacancy' do
      let(:data) { {} }

      it { is_expected.to eq(0) }
    end
  end

  describe 'middleman compatible delegated data sources' do
    subject { described_class.new('name' => 'grzesiek') }

    context 'when data key exists' do
      it 'delegates access to data source keys' do
        expect(subject.name).to eq 'grzesiek'
      end
    end

    context 'when data key does not exist' do
      it 'returns nil without raising an error' do
        expect(subject.country).to be_nil
      end
    end
  end
end
