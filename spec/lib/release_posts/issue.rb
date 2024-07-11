require 'spec_helper'
require_relative '../../lib/release_posts/issue'

describe ReleasePosts::Issue do
  let(:complete) do
    {
      'project_id' => 123,
      'idd' => 1,
      'title' => 'Gitaly Cluster',
      'description' => "## Release notes\nBig [problem](https://docs.gitlab.com/ee/administration/gitaly/praefect.html), simple solution! Example [ of strange `![]` characters.\n\n![](/uploads/image.png)\n\nDocs: https://docs.gitlab.com/ee/administration/gitaly/praefect.html\n\n## Proposal\nwhat we're building\n",
      'labels' => ['feature', 'group::gitaly', 'devops::create', 'category:Gitaly', 'GitLab Premium', 'GitLab Ultimate'],
      'milestone' => {
        'title' => '13.2',
        'due_date' => '2020-07-18'
      },
      'assignees' => [
        { 'username' => 'jramsay' },
        { 'username' => 'zj-gitlab' }
      ],
      'web_url' => 'https://gitlab.com/gitlab-org/gitaly/-/issues/1'
    }
  end
  let(:empty) do
    {
      'project_id' => 123,
      'idd' => 1,
      'title' => 'Gitaly Cluster',
      'description' => "empty",
      'labels' => [],
      'milestone' => {},
      'assignees' => [],
      'web_url' => 'https://gitlab.com/gitlab-org/gitaly/-/issues/1'
    }
  end
  let(:epic) { ReleasePosts::Issue.new(complete.tap { |k| k.delete('project_id') }, 'top') }
  let(:issue) { ReleasePosts::Issue.new(complete, 'primary') }
  let(:empty_issue) { ReleasePosts::Issue.new(empty, 'secondary') }

  describe '#epic?' do
    it 'returns true if the Issueable is an Epic' do
      expect(epic.epic?).to be_truthy
    end

    it 'returns false if the Issueable is an Issue' do
      expect(issue.epic?).to be_falsey
    end
  end

  describe '#issue?' do
    it 'returns true if the Issueable is an Issue' do
      expect(issue.issue?).to be_truthy
    end

    it 'returns false if the Issueable is an Epic' do
      expect(epic.issue?).to be_falsey
    end
  end

  describe '#group' do
    it 'returns the group that matches the group label' do
      expect(issue.group.key).to eq('gitaly')
    end

    it 'returns nil when no group label is set' do
      expect(empty_issue.group).to be_nil
    end
  end

  describe '#content' do
    it 'returns the extracted content block from the description' do
      expect(issue.content).to eq("Big [problem](https://docs.gitlab.com/ee/administration/gitaly/praefect.html), simple solution! Example [ of strange `![]` characters.\n")
    end

    it 'returns placeholder content when no content block found' do
      expect(empty_issue.content).to eq("Lorem ipsum [dolor sit amet](#link), consectetur adipisicing elit. Perferendis nisi vitae quod ipsum saepe cumque quia `veritatis`.\n")
    end
  end

  describe '#documentation_url' do
    it 'returns the first documentation URL from the description' do
      expect(issue.documentation_url).to eq('https://docs.gitlab.com/ee/administration/gitaly/praefect.html')
    end

    it 'returns placeholder URL when no content block found' do
      expect(empty_issue.documentation_url).to eq('https://docs.gitlab.com/ee/#amazing')
    end
  end

  describe '#image_url' do
    it 'returns the URL of the first image in the description' do
      expect(issue.image_url).to eq('/uploads/image.png')
    end

    it 'returns nil when no content block found' do
      expect(empty_issue.image_url).to be_nil
    end
  end

  describe '#absolute_image_url' do
    it 'returns the absolute URL of first image in the issue description' do
      expect(issue.absolute_image_url).to eq('https://gitlab.com/gitlab-org/gitaly/uploads/image.png')
    end

    it 'returns the absolute URL of first image in the issue description' do
      expect(epic.absolute_image_url).to eq('https://gitlab.com/gitlab-org/gitaly/-/uploads/image.png')
    end

    it 'returns nil when no content block found' do
      expect(empty_issue.absolute_image_url).to be_nil
    end
  end

  describe '#due_date' do
    it 'returns the formatted milestone due date when no due date set' do
      expect(issue.due_date).to eq('July 18, 2020')
    end

    it 'returns the placeholder date when no due date or milestone set' do
      expect(empty_issue.due_date).to eq('April 22, 2019')
    end
  end

  describe '#available_in' do
    it 'returns the tiers a feature is available in based on the issue labels' do
      expect(issue.available_in).to eq(%w[premium ultimate])
    end

    it 'returns all tiers when no labels are provided' do
      expect(empty_issue.available_in).to eq(%w[core premium ultimate])
    end
  end
end
