# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'release', :silence_stdout do
  before do
    Rake.application.rake_require 'tasks/update_gitlab_project_releases_page'
  end

  shared_examples 'calls service with correct params' do |task_name, project_id_env, is_ee|
    it 'executes the right service' do
      stub_env(project_id_env, 123)
      stub_env('GITLAB_BOT_TOKEN', "token123")

      expect_next_instance_of(UpdateReleasesService, 123, "token123", is_ee) do |service|
        expect(service).to receive(:execute)
      end

      run_rake_task(task_name)
    end

    it "raises an error if #{project_id_env} is not set" do
      stub_env('GITLAB_BOT_TOKEN', "token123")
      stub_env(project_id_env, nil)

      expect do
        run_rake_task(task_name)
      end.to raise_error("Set #{project_id_env} and GITLAB_BOT_TOKEN environment variables")
    end

    it "raises an error if GITLAB_BOT_TOKEN is not set" do
      stub_env(project_id_env, 123)
      stub_env('GITLAB_BOT_TOKEN', nil)

      expect do
        run_rake_task(task_name)
      end.to raise_error("Set #{project_id_env} and GITLAB_BOT_TOKEN environment variables")
    end
  end

  describe 'ee:update_project_releases_page' do
    include_examples 'calls service with correct params', "release:ee:update_project_releases_page", 'GITLAB_EE_PROJECT_ID', true
  end

  describe 'foss:update_project_releases_page' do
    include_examples 'calls service with correct params', "release:foss:update_project_releases_page", 'GITLAB_FOSS_PROJECT_ID', false
  end
end
