# If you do not have OpenSSL installed, change
# the following line to use 'http://'
source 'https://rubygems.org'

gem 'rake', '~> 13.0'

# For faster file watcher updates on Windows:
gem 'wdm', '~> 0.1.0', platforms: %i[mswin mingw x64_mingw]

# Windows does not come with time zone data
gem 'tzinfo-data', platforms: %i[mswin mingw x64_mingw jruby]

# Middleman Gems
gem 'middleman', '~> 4.4'
gem 'middleman-blog', '~> 4.0'
gem 'middleman-livereload', '~> 3.4.6'
gem 'middleman-minify-html', '~> 3.4.1'
gem 'middleman-autoprefixer'
gem 'middleman-syntax', '~> 3.0.0'
gem "middleman-inline_svg"

gem 'asciidoctor-plantuml', '0.0.9'
gem 'kramdown', '>= 2.3.1'
gem 'nokogiri', '>= 1.13.8'
gem 'sassc', '~> 2.2'
gem 'stringex', '~> 2.8.5'
gem 'countries', '~> 3.0.0'
gem 'rack', '~> 2.2.4'
gem 'webrick', '~> 1.7'

# OpenSSL for signing periscope URLs with SHA256 HMAC
gem 'openssl', '~> 2.2.0'

# For feed.xml.builder
gem 'builder', '~> 3.0'

# Direction generation
gem 'faraday', '~> 0.17'
gem 'faraday_middleware', '~> 0.14.0'
gem 'faraday_middleware-parse_oj', '~> 0.3'

# Handbook CHANGELOG generation
gem 'rss', '~> 0.2.8'

# Gitlab API access
gem 'gitlab', '~> 4.18.0'
gem 'graphql-client', '~> 0.16'

# Greenhouse API
gem 'greenhouse_io-gitlab', '~> 2.5.6'

# Linter checks
gem 'linter'

# API calls
gem 'rest-client'

# Release post item generator
gem 'styled_yaml'

# https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests/72546
gem 'json_schemer', '~> 0.2.17'

# For releases
gem 'version_sorter', '~> 2.3.0'

group :development, :test do
  gem 'html-proofer', '~> 3.12.2'
  gem 'rspec', '~> 3.5', require: false
  gem 'mdl', '~> 0.7.0', require: false
  gem 'rubocop', '~> 0.93.1', require: false
  gem 'rubocop-performance', '~> 1.10', require: false
  gem 'webmock', '~> 3.5.1'
  gem 'pry-byebug', '~> 3.9.0'
  gem 'timecop', '~> 0.9.4'
  gem 'lefthook', '~> 1.2.4', require: false
end
