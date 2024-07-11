require 'spec_helper'
require_relative '../../helpers/release_post_helpers'

describe ReleasePostHelpers do
  class FakeTemplate
    extend ReleasePostHelpers

    def self.data; end
  end

  describe '#release_post_items' do
    subject { FakeTemplate.release_post_items(milestone) }
    let(:milestone) { '13.0' }
    let(:release_posts) do
      {
        '13_0' => {
          'samples' => 'should be ignored',
          'top_feature.yml' => { 'features' => { 'top' => [{ 'name' => 'Top' }] } },
          '2_primary_feature.yml' => { 'features' => { 'primary' => [{ 'name' => 'Primary 1' }] } },
          '1_primary_feature.yml' => { 'features' => { 'primary' => [{ 'name' => 'Primary 2' }] } },
          'manage_first.yml' => { 'features' => { 'secondary' => [{ 'name' => 'Manage 1', 'stage' => 'manage' }] } },
          'create_first.yml' => { 'features' => { 'secondary' => [{ 'name' => 'Create 1', 'stage' => 'create' }] } },
          'manage_last.yml' => { 'features' => { 'secondary' => [{ 'name' => 'Manage 2', 'stage' => 'manage' }] } },
          'performance.yml' => { 'features' => { 'secondary' => [{ 'name' => 'Performance', 'stage' => nil }] } },
          '2_tertiary_feature.yml' => { 'tertiary' => [{ 'name' => 'Tertiary 1' }] },
          '1_tertiary_feature.yml' => { 'tertiary' => [{ 'name' => 'Tertiary 2' }] },
          'deprecation_last.yml' => { 'deprecations' => [{ 'feature_name' => 'Deprecations 2' }] },
          'deprecation_first.yml' => { 'deprecations' => [{ 'feature_name' => 'Deprecations 1' }] },
          'removals_last.yml' => { 'removals' => [{ 'feature_name' => 'Removals 2' }] },
          'removals_first.yml' => { 'removals' => [{ 'feature_name' => 'Removals 1' }] },
          'upgrade_notes.yml' => { 'upgrades' => [{ 'description' => 'Upgrade 1' }, { 'description' => 'Upgrade 2' }] }
        }
      }
    end

    before do
      allow(FakeTemplate).to receive(:data) { double(release_posts: release_posts) }
    end

    it 'returns post segments with a correct sorting order' do
      is_expected.to eq(
        'features' => {
          'top' => [{ 'name' => 'Top' }],
          'primary' => [
            { 'filename' => '1_primary_feature.yml', 'name' => 'Primary 2' },
            { 'filename' => '2_primary_feature.yml', 'name' => 'Primary 1' }
          ],
          'secondary' => [
            { 'name' => 'Manage 1', 'stage' => 'manage' },
            { 'name' => 'Manage 2', 'stage' => 'manage' },
            { 'name' => 'Create 1', 'stage' => 'create' },
            { 'name' => 'Performance', 'stage' => nil }
          ]
        },
        'tertiary' => [{ 'name' => 'Tertiary 1' }, { 'name' => 'Tertiary 2' }],
        'deprecations' => [{ 'feature_name' => 'Deprecations 1' }, { 'feature_name' => 'Deprecations 2' }],
        'removals' => [{ 'feature_name' => 'Removals 1' }, { 'feature_name' => 'Removals 2' }],
        'upgrades' => [{ 'description' => 'Upgrade 1' }, { 'description' => 'Upgrade 2' }]
      )
    end

    context 'when release posts are missing' do
      let(:release_posts) { {} }

      it 'returns empty values for post segments' do
        is_expected.to eq('features' => { 'top' => [], 'primary' => [], 'secondary' => [] }, 'tertiary' => [], 'deprecations' => [], 'removals' => [], 'upgrades' => [])
      end
    end

    context 'when release post does not exist for requested milestone' do
      let(:release_posts) { { '12_10' => { 'my_feature.yml' => { 'features' => { 'primary' => [{ 'name' => 'My Feature', 'stage' => 'plan' }] } } } } }

      it 'returns empty values for post segments' do
        is_expected.to eq('features' => { 'primary' => [], 'secondary' => [], 'top' => [] }, 'tertiary' => [], 'deprecations' => [], 'removals' => [], 'upgrades' => [])
      end
    end
  end
end
