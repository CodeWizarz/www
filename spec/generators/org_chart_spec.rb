require 'tempfile'
require 'yaml'
require_relative '../../generators/org_chart'

describe OrgChart do
  let(:team) do
    [
      {
        'name' => 'King Kong',
        'reports_to' => nil,
        'role' => 'King',
        'slug' => 'king',
        'speciality' => nil,
        'placeholder' => false,
        'start_date' => Date.strptime('1971-01-01', '%Y-%m-%d'),
        'type' => 'person',
        'gitlab' => 'rexkong'
      },
      {
        'name' => 'Donkey Kong',
        'reports_to' => 'king',
        'role' => 'King',
        'slug' => 'general',
        'speciality' => nil,
        'placeholder' => false,
        'start_date' => Date.strptime('1971-01-01', '%Y-%m-%d'),
        'type' => 'person',
        'gitlab' => 'asinong'
      },
      {
        'name' => 'Q-Bert',
        'reports_to' => 'general',
        'role' => 'Peon',
        'slug' => 'q-bert',
        'speciality' => '@#%@#$',
        'placeholder' => false,
        'start_date' => Date.strptime('1971-01-01', '%Y-%m-%d'),
        'type' => 'person'
      },
      {
        'name' => 'PacMan',
        'reports_to' => 'general',
        'role' => 'Peon',
        'slug' => 'pacman',
        'speciality' => 'eating ghosts',
        'placeholder' => false,
        'start_date' => Date.strptime('1971-01-01', '%Y-%m-%d'),
        'type' => 'person'
      },
      {
        'name' => 'Vacancy',
        'reports_to' => 'king',
        'role' => 'vacancy',
        'slug' => 'vacancy-1',
        'speciality' => nil,
        'placeholder' => true,
        'start_date' => Date.strptime('1971-01-01', '%Y-%m-%d'),
        'type' => 'vacancy'
      }
    ]
  end

  let(:yaml) do
    ::Gitlab::Homepage::Team::Yaml.new
  end

  subject { OrgChart.new(yaml) }

  before do
    allow(yaml).to receive(:build_team).and_return(team)
  end

  describe '#team_data' do
    it 'augments team data with proper leads' do
      data = subject.team_data

      expect(data.count).to eq(team.count)

      additional_fields = [
        { lead: nil,                                       vacant_reports_count: 1, direct_reports_count: 1 },
        { lead: a_hash_including('name' => 'King Kong'),   vacant_reports_count: 0, direct_reports_count: 2 },
        { lead: a_hash_including('name' => 'Donkey Kong'), vacant_reports_count: 0, direct_reports_count: 0 },
        { lead: a_hash_including('name' => 'Donkey Kong'), vacant_reports_count: 0, direct_reports_count: 0 },
        { lead: a_hash_including('name' => 'King Kong'),   vacant_reports_count: 0, direct_reports_count: 0 }
      ]

      expect(data).to match_array(team.each_with_index.map do |entry, i|
        {
          anchor: entry['gitlab'] || entry['slug'],
          slug: entry['slug'],
          name: entry['name'],
          speciality: entry['speciality'],
          link: entry['role'],
          type: entry['type'],
          placeholder: entry['placeholder']
        }.merge(additional_fields[i])
      end)
    end
  end

  describe '#team_data_tree' do
    it 'builds children properly' do
      tree = subject.team_data_tree

      expect(tree.first[:name]).to eq('King Kong')
      expect(tree.first[:link]).to eq('King')
      expect(tree.first[:anchor]).to eq('rexkong')
      expect(tree.first[:children].count).to eq(2)
      expect(tree.first[:children][0][:name]).to eq('Donkey Kong')
      expect(tree.first[:children][1][:name]).to eq('Vacancy')
      expect(tree.first[:direct_reports_count]).to eq(1)
      expect(tree.first[:vacant_reports_count]).to eq(1)
      expect(tree.first[:descendents]).to eq(3)

      general = tree.first[:children].first
      expect(general[:direct_reports_count]).to eq(2)
      expect(general[:vacant_reports_count]).to eq(0)
      expect(general[:descendents]).to eq(2)

      general_reports = tree.first[:children][0][:children]
      expect(general_reports.count).to eq(2)
      expect(general_reports[0][:name]).to eq('PacMan')
      expect(general_reports[1][:name]).to eq('Q-Bert')
    end
  end
end
