$LOAD_PATH << File.expand_path('..', __dir__)

require 'middleman-core'
require 'middleman-core/rack'

require 'middleman-autoprefixer'
require 'middleman-blog'
require 'middleman-syntax'

require 'lib/changelog'
require 'lib/release_posts'
require 'lib/gitlab/file_cache'
require 'lib/homepage'
require 'lib/redirect'
require 'lib/code_owners'

require 'webmock/rspec'
require 'pry-byebug'
require 'timecop'

# Disable the ApiRetry logic in test by default
ENV['API_RETRY_DISABLED'] ||= 'true'

Dir[File.expand_path(File.join(File.dirname(__FILE__), 'support', '**', '*.rb'))].sort.each { |f| require f }

RSpec.configure do |config|
  config.include StubENV
  config.include NextInstanceOf
  config.include RakeHelpers

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.order = :random
  Kernel.srand config.seed

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end
