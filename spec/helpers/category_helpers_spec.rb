require 'spec_helper'
require_relative '../../helpers/category_helpers'

describe CategoryHelpers do
  class FakeTemplate
    extend CategoryHelpers
  end
  let(:category_class) { Gitlab::Homepage::Category }

  let(:categories) do
    [
      category_class.new('A', { 'maturity' => 'lovable', 'marketing' => true }),
      category_class.new('B', { 'maturity' => 'viable', 'marketing' => true }),
      category_class.new('C', { 'maturity' => 'complete', 'marketing' => true }),
      category_class.new('D', { 'maturity' => 'minimal', 'marketing' => false }),
      category_class.new('E', { 'maturity' => 'planned', 'marketing' => false }),
      category_class.new('F', { 'maturity' => 'planned', 'marketing' => true }),
      category_class.new('G', { 'maturity' => '', 'marketing' => true })
    ]
  end

  describe '.active_categories' do
    subject { FakeTemplate.active_categories(categories) }

    it 'returns active categories sorted by maturity descending' do
      expect(subject.map(&:key)).to eq(%w[A C B])
    end
  end

  describe '.planned_categories' do
    subject { FakeTemplate.planned_categories(categories) }

    it 'returns all planned categories' do
      expect(subject.map(&:key)).to eq(['F'])
    end
  end

  describe '.available_categories' do
    subject { FakeTemplate.available_categories(categories, date) }
    let(:date) { Date.new(2020, 1, 1) }

    let(:categories) do
      [
        category_class.new('A', { 'available' => Date.new(2010, 1, 1), 'marketing' => true }),
        category_class.new('B', { 'available' => Date.new(2010, 1, 1), 'lovable' => Date.new(2019, 1, 1), 'marketing' => true }),
        category_class.new('C', { 'available' => Date.new(2010, 1, 1), 'viable' => Date.new(2020, 1, 1), 'marketing' => true }),

        category_class.new('D', { 'viable' => Date.new(2022, 1, 1), 'marketing' => true }),
        category_class.new('E', { 'available' => Date.new(2020, 1, 1), 'viable' => Date.new(2020, 1, 1), 'marketing' => false })
      ]
    end

    it 'returns available categories on requested date sorted by maturity descending' do
      expect(subject.map(&:key)).to eq(%w[B C A])
    end
  end

  describe '.unavailable_categories' do
    subject { FakeTemplate.unavailable_categories(categories, date) }
    let(:date) { Date.new(2020, 1, 1) }

    let(:categories) do
      [
        category_class.new('A', { 'available' => Date.new(2010, 1, 1), 'marketing' => true }),
        category_class.new('B', { 'available' => Date.new(2022, 1, 1), 'marketing' => true })
      ]
    end

    it 'returns list of categories after requested date' do
      expect(subject.map(&:key)).to eq(['B'])
    end
  end
end
