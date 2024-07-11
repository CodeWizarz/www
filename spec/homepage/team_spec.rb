describe Gitlab::Homepage::Team do
  describe '#members' do
    it 'returns an array of team members' do
      expect(subject.members).to all(be_a Gitlab::Homepage::Team::Member)
    end
  end

  describe '#projects' do
    it 'returns a list of projects with members assigned' do
      expect(subject.projects.first.key).to eq 'gitlab'
      expect(subject.projects.first.maintainers.count).to be_nonzero
    end
  end

  describe '#departments' do
    it 'returns a hash of departments and respective member and vacancy count' do
      expect(subject.departments[0].first).to eq 'AI-powered:AI Framework'
      expect(subject.departments[0][1].keys).to contain_exactly(:members, :vacancies)
    end
  end

  describe 'integration with YAML data sources' do
    describe 'first team member validations' do
      let(:member) { subject.members.find { |member| member.username == 'sytses' } }

      it 'correctly integrates with data/team_members entry' do
        expect(member.username).to eq 'sytses'
        # expect(member.country).to eq 'USA'
        expect(member.country).to eq 'Remote'
        expect(member.story).to match /Sid saw the first ruby code in 2007/
        expect(member.project_roles).to be_a Hash
        expect(member.assignments).to be_a Array
        expect(member.departments).to be_a Array
      end
    end

    describe 'first project validations' do
      let(:project) { subject.projects.first }

      it 'correctly integrates with data/projects.yml' do
        expect(project.name). to eq 'GitLab'
        expect(project.assignments.first.username).to_not be_nil
      end
    end

    describe 'dangling assignments validation' do
      let(:members) { subject.members }
      let(:projects) { subject.projects }

      it 'does not assign non-existent projects to anyone' do
        members.each do |member|
          member.project_roles.each_key do |key|
            expect(key).to satisfy('be a defined project key') do |k|
              projects.any? { |project| k == project.key }
            end
          end
        end
      end
    end
  end

  describe '#direct_team' do
    it 'returns the direct reports of a role, plus the role itself, with the manager first' do
      direct_team = subject.direct_team(manager_role: 'Chief Financial Officer (CFO)')

      expect(direct_team).to all(be_a(Gitlab::Homepage::Team::Member))
      expect(direct_team.first.text_role).to eq('Chief Financial Officer (CFO)')
      expect(direct_team.length).to be > 1
    end

    it 'returns only the manager if nothing matches' do
      direct_team = subject.direct_team(role_regexp: /[,&] SomethingThatDoesntMatch/, manager_role: 'Chief Financial Officer (CFO)')
      expect(direct_team.first.text_role).to eq('Chief Financial Officer (CFO)')
      expect(direct_team.length).to be 1
    end

    it 'returns an empty array if the role is not found' do
      expect(subject.direct_team(manager_role: 'Double CEO')).to be_empty
    end
  end
end
