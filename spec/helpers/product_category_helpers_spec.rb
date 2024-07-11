require 'spec_helper'
require_relative '../../helpers/product_category_helpers'

describe ProductCategoryHelpers do
  let(:klass) do
    Class.new do
      include ProductCategoryHelpers

      def initialize(stages)
        @stages = stages
      end

      def data
        Middleman::Util::EnhancedHash.new(stages: { stages: @stages })
      end
    end
  end

  let(:stages) do
    {
      manage: {
        groups: {
          access: {
            name: 'Access',
            categories: %w[authentication_and_authorization subgroups users],
            uxr: %w[User1 User2 User1]
          }
        }
      },
      plan: {
        groups: {
          project_management: {
            name: 'Project Management',
            categories: %w[issue_tracking boards time_tracking jira_importer projects],
            uxr: 'User'
          },
          no_categories: {
            name: 'No categories'
          }
        }
      },
      stage_no_groups: {}
    }
  end

  subject { klass.new(stages) }

  describe '#category_groups' do
    it 'returns a hash mapping category slugs to groups' do
      expect(subject.category_groups)
        .to include('authentication_and_authorization' => stages.dig(:manage, :groups, :access),
                    'boards' => stages.dig(:plan, :groups, :project_management))
    end
  end

  describe '#category_group_link' do
    it 'returns "Not owned" when the category has no group' do
      expect(subject.category_group_link('no_group')).to eq('Not owned')
    end

    it 'returns a link to the group when the category has a group' do
      expect(subject.category_group_link('projects')).to eq('[Project Management](#project-management-group)')
    end
  end

  describe '#display_users_group' do
    let(:label) { 'UX Researcher' }
    let(:group) { stages.dig(:manage, :groups, :access, :uxr) }

    it 'returns a pluralized list of unique users' do
      expect(subject.display_users_group(label, group)).to eq 'UX Researchers: [User1], [User2]'
    end

    context 'when pluralize: false' do
      it 'returns label as a singular' do
        expect(subject.display_users_group(label, group, pluralize: false)).to eq 'UX Researcher: [User1], [User2]'
      end
    end

    context 'when group is not an array' do
      let(:group) { stages.dig(:plan, :groups, :project_management, :uxr) }

      it 'returns a single user' do
        expect(subject.display_users_group(label, group)).to eq 'UX Researcher: [User]'
      end
    end

    context 'when group does not exists' do
      let(:group) { stages.dig(:plan, :groups, :no_categories, :uxr) }

      it 'returns an empty result' do
        expect(subject.display_users_group(label, group)).to eq('')
      end
    end
  end

  describe '#member_placeholder' do
    let(:member) { 'John Smith' }

    it 'returns a placeholder for member' do
      expect(subject.member_placeholder(member)).to eq('[John Smith]')
    end

    context 'when member has a status' do
      let(:member) { 'John Smith (Interim)' }

      it 'returns a placeholder with a status' do
        expect(subject.member_placeholder(member)).to eq('[John Smith] (Interim)')
      end
    end
  end
end
