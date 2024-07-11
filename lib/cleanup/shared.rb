require_relative '../gitlab_api_project_id'

module Cleanup
  module Shared
    private

    def dry_run?
      # comment out this guard once we are ready to run it on the real repo
      # return true if project_id == WWW_GITLAB_COM_PROJECT_ID

      ENV['CLEANUP_DRY_RUN'] == 'true'
    end

    def project_id
      cleanup_project_id = ENV['CLEANUP_PROJECT_ID']
      cleanup_project_id ? cleanup_project_id.to_i : WWW_GITLAB_COM_PROJECT_ID
    end

    def project_full_path
      cleanup_project_full_path = ENV['CLEANUP_PROJECT_FULL_PATH']
      cleanup_project_full_path || 'gitlab-com/www-gitlab-com'
    end

    def label_title
      'stale - to be closed'
    end
  end
end
