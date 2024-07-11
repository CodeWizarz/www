require 'spec_helper'
require_relative '../../../lib/team/yaml'

describe Gitlab::Homepage::Team::Member do
  subject(:member) { described_class.new(data) }

  let(:data) do
    { 'slug' => 'snail', 'gitlab' => 'schnecke', 'start_date' => Date.new(2010, 1, 1) }
  end

  it 'can access properties as methods' do
    expect(member.slug).to eq('snail')
  end

  it 'can access properties with lookup, supporting indifferent access' do
    expect(member[:slug]).to eq('snail')
    expect(member['slug']).to eq('snail')
  end

  it 'aliases gitlab to username' do
    expect(member.username).to eq('schnecke')
  end

  describe '#group' do
    before(:each) do
      allow(subject).to receive(:departments).and_return(departments)
    end
    let(:departments) do
      [
        'Engineering Function',
        'Development Department',
        'Ops Sub-department',
        group_entry,
        team_entry
      ]
    end
    let(:group_entry) { '' }
    let(:result) { subject.group }
    let(:team_entry) { '' }

    context 'when there is a group entry' do
      let(:group_entry) { 'Verify:Pipeline Security Group' }

      it 'returns the group entry' do
        expect(result).to eq('Verify:Pipeline Security')
      end
    end

    context 'when there is no group entry, but there is a team entry' do
      let(:team_entry) { 'Verify:Pipeline Security BE Team' }

      it 'returns the team entry' do
        expect(result).to eq('Verify:Pipeline Security')
      end
    end

    context 'when there is no group or team entry' do
      let(:team_entry) { '' }

      it 'returns a default string' do
        expect(result).to eq('None')
      end
    end
  end

  describe '#job_families' do
    let(:ceo) do
      %(
        <a href="/job-families/chief-executive-officer/">Chief Executive Officer (CEO)</a>
        <a href="/job-families/board-of-directors/board_member/">Board of Directors</a>
      )
    end

    let(:engineer) do
      '<a href="/job-families/engineering/development/backend/">Senior Backend Engineer</a>'
    end

    let(:sales_director) do
      '<a href="/job-families/sales/regional-sales-director/">Regional Sales Director, APAC</a>'
    end

    let(:meltano_engineer) do
      '<a href="/job-families/engineering/backend-engineer/#meltano/">Sr. Backend Engineer, Meltano</a>'
    end

    it 'extracts job families correctly' do
      members = [ceo, engineer, sales_director, meltano_engineer].map do |role|
        data = { 'role' => role }
        described_class.new(data)
      end

      job_families = members.flat_map(&:job_families)

      expect(job_families).to contain_exactly(
        '/job-families/board-of-directors/board_member/',
        '/job-families/chief-executive-officer/',
        '/job-families/engineering/development/backend/',
        '/job-families/engineering/backend-engineer/',
        '/job-families/sales/regional-sales-director/'
      )
    end
  end

  it 'knows its source file path' do
    expect(member.source_file_path).to eq('data/team_members/person/s/snail.yml')
  end

  it 'sorts by type and start-date' do
    worm = described_class.new({ 'slug' => 'worm', 'type' => 'person', 'start_date' => 5.days.ago })
    wasp = described_class.new({ 'slug' => 'wasp', 'type' => 'vacancy', 'start_date' => Date.today })
    weavil = described_class.new({ 'slug' => 'weavil', 'type' => 'person', 'start_date' => 1.day.from_now })

    expect([worm, wasp, weavil].sort).to eq [worm, weavil, wasp]
  end

  it 'uses slug for equality' do
    expect(member).to eq described_class.new({ 'slug' => 'snail' })
    expect(member).not_to eq described_class.new({ 'slug' => 'escargot', 'gitlab' => 'schnecke' })
  end
end
