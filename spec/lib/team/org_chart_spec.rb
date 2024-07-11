require 'spec_helper'
require_relative '../../../lib/team/org_chart'

describe Gitlab::Homepage::OrgChart do
  subject { described_class.new(team) }

  # - root_a
  #   |-- c
  #   |   |-- d
  #   |   |-- b (vacancy)
  #   |       |-- a (vacancy)
  #   |-- x (vacancy)
  #   |-- y
  #   |   |-- r
  #   |   |-- s (vacancy)
  #   |   |-- t
  #   |-- z
  #       |-- phi
  #       |-- theta
  #       |-- chi
  # - root_b
  #
  describe '#forest' do
    let(:team) do
      [
        { 'slug' => :root_b },
        { 'slug' => :a, 'reports_to' => :b, 'type' => 'vacancy' },
        { 'slug' => :b, 'reports_to' => :c, 'type' => 'vacancy' },
        { 'slug' => :c, 'reports_to' => :root_a },
        { 'slug' => :d, 'reports_to' => :c },
        { 'slug' => :x, 'reports_to' => :root_a, 'type' => 'vacancy' },
        { 'slug' => :y, 'reports_to' => :root_a },
        { 'slug' => :z, 'reports_to' => :root_a },
        { 'slug' => :r, 'reports_to' => :y },
        { 'slug' => :s, 'reports_to' => :y, 'type' => 'vacancy' },
        { 'slug' => :t, 'reports_to' => :y },
        { 'slug' => :phi, 'reports_to' => :z },
        { 'slug' => :theta, 'reports_to' => :z },
        { 'slug' => :chi, 'reports_to' => :z },
        { 'slug' => :root_a }
      ]
    end

    it 'can recover the structure of the tree' do
      data = subject.forest.map { |t| from_tree(t) }

      expect(data).to eq [
        {
          value: :root_a,
          leaves: [
            {
              value: :z,
              leaves: [
                { value: :chi, leaves: [] },
                { value: :phi, leaves: [] },
                { value: :theta, leaves: [] }
              ]
            },
            {
              value: :y,
              leaves: [
                { value: :r, leaves: [] },
                { value: :s, leaves: [] },
                { value: :t, leaves: [] }
              ]
            },
            {
              value: :c,
              leaves: [
                {
                  value: :b,
                  leaves: [{ value: :a, leaves: [] }]
                },
                { value: :d, leaves: [] }
              ]
            },
            {
              value: :x, leaves: []
            }
          ]
        },
        {
          value: :root_b,
          leaves: []
        }
      ]
    end

    it 'can recover the elements of the tree, with counts' do
      slugs_and_counts = subject.forest.flat_map(&:to_list).map do |tree|
        [tree.member['slug'], tree.total_count, tree.direct_count, tree.vacancies]
      end

      expect(slugs_and_counts).to contain_exactly(
        [:root_a, 9, 3, 4],
        [:c,      1, 1, 2],
        [:d,      0, 0, 0],
        [:b,      0, 0, 1],
        [:a,      0, 0, 0],
        [:root_b, 0, 0, 0],
        [:x,      0, 0, 0],
        [:y,      2, 2, 1],
        [:z,      3, 3, 0],
        [:r,      0, 0, 0],
        [:s,      0, 0, 0],
        [:t,      0, 0, 0],
        [:phi,    0, 0, 0],
        [:theta,  0, 0, 0],
        [:chi,    0, 0, 0]
      )
    end

    def from_tree(tree)
      { value: tree.member['slug'], leaves: tree.reports.map { |t| from_tree(t) } }
    end
  end

  describe '#validate' do
    context 'the team is good' do
      let(:team) do
        [
          { 'slug' => 0, 'reports_to' => 1 },
          { 'slug' => 1, 'reports_to' => 2 },
          { 'slug' => 2, 'reports_to' => 3 },
          { 'slug' => 4, 'reports_to' => 2 },
          { 'slug' => 3 }
        ]
      end

      it 'returns an empty list' do
        expect(subject.validate).to be_none
      end
    end

    context 'the team has problems' do
      let(:team) do
        [
          { 'slug' => 0, 'reports_to' => 1 }
        ]
      end

      it 'returns at least one item' do
        expect(subject.validate).to be_any
      end
    end
  end

  describe '#verify_valid_managers!' do
    context 'the team has no missing managers' do
      let(:team) do
        [
          { 'slug' => 0, 'reports_to' => 1 },
          { 'slug' => 1, 'reports_to' => 2 },
          { 'slug' => 2, 'reports_to' => 3 },
          { 'slug' => 4, 'reports_to' => 2 },
          { 'slug' => 3 }
        ]
      end

      it 'returns nil' do
        expect(subject.send(:verify_valid_managers!, 'reports_to')).to be_nil
      end
    end

    context 'the team has missing managers' do
      let(:team) do
        [
          { 'slug' => 0, 'reports_to' => 1 },
          { 'slug' => 1, 'reports_to' => 2 },
          { 'slug' => 2, 'reports_to' => 3 },
          { 'slug' => 4, 'reports_to' => 2 }
        ]
      end

      it 'returns a suitable error message' do
        expect(subject.send(:verify_valid_managers!, 'reports_to')).to match(/Missing managers/)
      end
    end

    context 'the team has missing borrowing managers' do
      let(:team) do
        [
          { 'slug' => 0, 'borrow' => { 'to' => 1 } },
          { 'slug' => 1, 'borrow' => { 'to' => 2 } },
          { 'slug' => 2, 'borrow' => { 'to' => 3 } },
          { 'slug' => 4, 'borrow' => { 'to' => 2 } }
        ]
      end

      it 'returns a suitable error message' do
        expect(subject.send(:verify_valid_managers!, 'borrow', 'to')).to match(/Missing managers/)
      end
    end
  end

  describe '#verify_valid_borrow!' do
    context 'the team has missing borrowing managers' do
      let(:team) do
        [
          { 'slug' => 0, 'borrow' => { 'to' => 1 } },
          { 'slug' => 1, 'borrow' => { 'to' => 2 } },
          { 'slug' => 2, 'borrow' => { 'to' => 3 } },
          { 'slug' => 4, 'borrow' => { 'to' => 2 } }
        ]
      end

      it 'returns a suitable error message' do
        expect(subject.send(:verify_valid_borrow!).join("\n")).to match(/Missing managers/)
      end
    end
    context 'the team has invalid borrow end dates' do
      let(:team) do
        [
          { 'slug' => 0, 'borrow' => { 'to' => 1, 'end_date' => Date.parse('2023-09-15') } },
          { 'slug' => 1, 'borrow' => { 'to' => 1, 'end_date' => '2023-09-15' } },
          { 'slug' => 2, 'borrow' => { 'to' => 2, 'end_date' => 'foo' } },
          { 'slug' => 3 }
        ]
      end

      it 'returns a suitable error message' do
        expect(subject.send(:verify_valid_borrow!).join("\n")).to match(/Invalid borrow end dates/)
      end
    end
  end

  describe '#verify_no_cycles!' do
    context 'the team has no cycles' do
      let(:team) do
        [
          { 'slug' => 0, 'reports_to' => 1 },
          { 'slug' => 1, 'reports_to' => 2 },
          { 'slug' => 2, 'reports_to' => 3 },
          { 'slug' => 4, 'reports_to' => 2 },
          { 'slug' => 3 }
        ]
      end

      it 'returns nil' do
        expect(subject.send(:verify_no_cycles!)).to be_nil
      end
    end

    context 'the team has a cycle' do
      let(:team) do
        [
          { 'slug' => 0, 'reports_to' => 1 },
          { 'slug' => 1, 'reports_to' => 2 },
          { 'slug' => 2, 'reports_to' => 3 },
          { 'slug' => 4, 'reports_to' => 2 },
          { 'slug' => 3, 'reports_to' => 1 }
        ]
      end

      it 'returns an error message' do
        expect(subject.send(:verify_no_cycles!)).to match(/Cycle found/)
      end
    end

    context 'the team has a cycle in a disconnected component' do
      let(:team) do
        [
          { 'slug' => 0, 'reports_to' => 1 },
          { 'slug' => 1, 'reports_to' => 2 },
          { 'slug' => 2, 'reports_to' => 3 },
          { 'slug' => 4, 'reports_to' => 2 },
          { 'slug' => 3 },
          { 'slug' => 100, 'reports_to' => 101 },
          { 'slug' => 101, 'reports_to' => 102 },
          { 'slug' => 102, 'reports_to' => 100 }
        ]
      end

      it 'returns an error message' do
        expect(subject.send(:verify_no_cycles!)).to match(/Cycle found/)
      end
    end
  end
end
