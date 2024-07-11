require 'yaml'
require 'stringex'
require 'time'
require 'middleman'
require 'gitlab'
require_relative './generators/direction'
require_relative './generators/releases'

# New tasks can be added direcly in this file
# or in a new file in lib/tasks with a .rake extension
# For example: lib/tasks/my_new_task.rake
Dir.glob('lib/tasks/*.rake').each { |r| load r }

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec, :tag) do |t, task_args|
    t.rspec_opts = "--tag #{task_args[:tag] || '~@feature'}"
  end
rescue LoadError
  # no rspec available
end

task default: :spec

desc 'Begin a new post'
task :new_post, :title do |t, args|
  if args.title
    title = args.title
  else
    puts 'Enter a title for your post: '
    title = STDIN.gets.chomp
  end

  filename = "sites/uncategorized/source/blog/blog-posts/#{Time.now.strftime('%Y-%m-%d')}-#{title.to_url}.html.md.erb"
  puts "Creating new post: #{filename}"
  File.open(filename, 'w') do |post|
    post.puts '---'
    post.puts "title: \"#{title.gsub(/&/, '&amp;')}\""
    post.puts 'author: Firstname Lastname # if name includes special characters use double quotes "First Last"'
    post.puts 'author_gitlab: GitLab.com username # ex: johndoe'
    post.puts 'author_twitter: Twitter username or gitlab # ex: johndoe'
    post.puts 'categories: company'
    post.puts 'image_title: "/images/blogimages/post-cover-image.jpg"'
    post.puts 'description: "Short description for the blog post"'
    post.puts 'tags: tag1, tag2, tag3'
    post.puts 'cta_button_text: "Watch the <strong>XXX release webcast</strong> live!" # optional'
    post.puts 'cta_button_link: "https://page.gitlab.com/xxx.html" # optional'
    post.puts 'guest: false # required when the author is not a GitLab Team Member'
    post.puts 'ee_cta: false # required only if you do not want to display the EE-trial banner'
    post.puts 'install_cta: false # required only if you do not want to display the "Install GitLab" banner'
    post.puts "twitter_text: \"Text to tweet\" # optional;  If no text is provided it will use post's title."
    post.puts 'featured: yes # reviewer should set'
    post.puts '---'
  end
end

namespace :generators do
  desc 'Executes direction generator'
  task :direction do
    Generators::Direction.new.generate
  end

  desc 'Executes releases generator'
  task :releases do
    ReleaseList.new.generate($stdout)
  end
end

# Monthly release post
# https://about.gitlab.com/handbook/marketing/blog/release-posts/#schedule
namespace :release do
  # Do not use this task for major or minor releases that go out every month
  desc 'Creates a new release post for patch versions'
  task :patch, :version do |t, args|
    version = args.version
    raise 'You need to specify a patch version, like 10.1.1' unless /\A\d+\.\d+\.\d+\z/.match?(version)

    destination = File.expand_path('sites/uncategorized/source/releases/posts', __dir__)

    date = Time.now.strftime('%Y-%m-%d')
    filename = "#{destination}/#{date}-gitlab-#{version.tr('.', '-')}-released.html.md"

    if File.exist?(filename)
      abort('rake aborted!') if ask("#{filename} already exists. Do you want to overwrite?", %w[y n]) == 'n'
    end

    puts "Creating new release post: #{filename}"

    template_text = File.read('doc/templates/blog/patch_release_blog_template.html.md.erb')
    template = ERB.new(template_text).result(binding)

    File.open(filename, 'w') do |post|
      post.puts template
    end
  end
end

desc 'Create a new press release'
task :new_press, :title do |t, args|
  data_dir = File.expand_path('data', __dir__)

  puts 'Enter a date for the press release (ISO format, example: 2016-12-30): '
  date = STDIN.gets.chomp
  puts 'Enter a title for the press release: '
  title = STDIN.gets.chomp

  filename = "source/press/releases/#{date}-#{title.to_url}.html.md"
  puts "Creating new press release: #{filename}"
  File.open(filename, 'w') do |pressrel|
    pressrel.puts '---'
    pressrel.puts 'layout: markdown_page'
    pressrel.puts "title: \"#{title.gsub(/&/, '&amp;')}\""
    pressrel.puts '---'
    pressrel.puts ''
  end

  press_yml = "#{data_dir}/press_releases.yml"
  puts 'Populating data/press_releases.yml'
  File.open(press_yml, 'a') do |yaml|
    yaml.puts ''
    yaml.puts "- title: \"#{title.gsub(/&/, '&amp;')}\""
    yaml.puts "  link: #{date}-#{title.to_url}.html"
    yaml.puts "  date: #{date}"
  end
end

desc 'Add an existing press release to the archive'
task :add_press, :title do |t, args|
  data_dir = File.expand_path('data', __dir__)

  puts 'Enter a date for the press release (ISO format, example: 2016-12-30): '
  date = STDIN.gets.chomp
  puts 'Enter a title for the press release: '
  title = STDIN.gets.chomp
  puts 'Enter the URL of the press release: '
  link = STDIN.gets.chomp

  press_yml = "#{data_dir}/press_releases.yml"
  puts 'Populating data/press_releases.yml'
  File.open(press_yml, 'a') do |yaml|
    yaml.puts ''
    yaml.puts "- title: \"#{title}\""
    yaml.puts "  link: #{link}"
    yaml.puts "  date: #{date}"
  end
end
