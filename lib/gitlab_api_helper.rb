require 'gitlab'
require_relative './gitlab_api_project_id'

Gitlab.configure do |config|
  config.endpoint = 'https://gitlab.com/api/v4'
  config.private_token = ENV.fetch('PRIVATE_TOKEN', nil)
end
