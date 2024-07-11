require 'extensions/destination_path_regexes_filter'

activate :destination_path_regexes_filter # Extension to handle building only certain paths of the site

activate :autoprefixer do |config|
  config.browsers = ['last 2 versions', 'Explorer >= 9']
end

configure :build do
  set :build_dir, 'public'
end
