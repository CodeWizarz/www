require 'time'
require 'yaml'
require 'colorize'
require 'mdl'
require_relative '../redirect.rb'
require_relative '../team.rb'
require_relative '../homepage.rb'

desc 'Run all lint tasks'
task lint: ['lint:scss',
            'lint:yamllint',
            'lint:handbook_links',
            'lint:blog:categories',
            'lint:blog:unfiltered',
            'lint:mvps',
            'lint:monorepo_structure',
            'lint:redirects_yml',
            'lint:team_yml:all',
            'lint:categories_yml:links',
            'lint:codeowners',
            'lint:docs_ee',
            'lint:speakers_yml:gitlab_names',
            'lint:speakers_yml:unique',
            'lint:speakers_yml:region',
            'lint:speakers_yml:topics',
            'lint:netlifycms'] do
end

namespace :lint do
  desc 'Lint SCSS files'
  task :scss do
    puts ''
    puts '=> Lint SCSS files'

    cmd = 'npx sass-lint -c .sass-lint.yml **/*.scss -v --max-warnings 0'
    raise "command failed: #{cmd}" unless system(cmd)
  end

  desc 'Lint YAML files with yamllint'
  task :yamllint do
    puts ''
    puts '=> Lint all YAML files under data/ with yamllint'

    raise '`yamllint` is not installed. Please install via `brew` or `apt`' unless system('which yamllint')

    cmd = 'yamllint --config-file .yamllint.yml data/'
    raise "command failed: #{cmd}" unless system(cmd)
  end

  desc 'Lint Handbook links'
  task :handbook_links do
    puts ''
    puts '=> Lint Handbook links'

    begin
      MarkdownLint.run(['-u', 'lib/lint/handbook_link_linter.rb', '-r', 'LINK'] + Dir['sites/handbook/source/handbook/**/*.md'])
    rescue SystemExit => e
      unless e.success?
        puts 'How-to fix the problem: https://about.gitlab.com/handbook/about/support/#handbook-links-and-anchors'.yellow
        raise e
      end
    end
  end

  # TODO: This task currently does nothing, because it runs as part of a lint job,
  #       where the public directory never exists.  This would need to be moved to
  #       a separate job which is dependent upon pulling down the artifact which
  #       contains the public/features dir. See `check-handbook-edit-links` for an example.
  # See https://gitlab.com/gitlab-com/www-gitlab-com/-/issues/11915
  namespace :features do
    desc "Ensure every feature's documentation link is working"
    task :links do
      puts "=> Checking if every feature's documentation link is working"

      require 'html-proofer'
      HTMLProofer.check_directory("./public/features",
                                  {
                                    url_ignore: [%r{(^\/.*|google|youtu\.be|linkedin|optimizely)}],
                                    assume_extension: true,
                                    typhoeus: {
                                      ssl_verifypeer: false
                                    }
                                  }).run
    end
  end

  namespace :blog do
    desc "Ensure every post has one of the right categories"
    task :categories do
      ## Taken from Jekyll
      ## https://github.com/jekyll/jekyll/blob/3.5-stable/lib/jekyll/document.rb#L13
      YAML_FRONT_MATTER_REGEXP = /\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)/m

      ## Categories as defined in
      ## https://about.gitlab.com/handbook/marketing/blog/#categories
      CATEGORIES = ['engineering',
                    'open source',
                    'culture',
                    'insights',
                    'company',
                    'security',
                    'unfiltered'].freeze

      count = 0

      puts ''
      puts '=> Checking if any posts have incorrect categories...'

      Dir[File.expand_path('sites/uncategorized/source/blog/blog-posts/*', __dir__)].each do |post|
        content = File.read(post)
        data = content.scan(YAML_FRONT_MATTER_REGEXP)&.last&.first

        unless data
          puts "=> Empty header in #{post}"
          count += 1
          next
        end

        ## Disable Rubocop due to https://github.com/ruby/psych/issues/262
        ## We only parse the file, so there's no security issue anyway
        # rubocop:disable Security/YAMLLoad

        begin
          to_yaml = YAML.load(data)
        rescue Psych::SyntaxError => e
          puts "=> Error in YAML syntax in #{post}: #{e}"
          raise
        end
        # rubocop:enable Security/YAMLLoad

        unless CATEGORIES.include? to_yaml['categories']
          puts "=> Missing proper category in #{post}"
          count += 1
        end
      end

      if count.positive?
        puts
        puts "#{count} missing or wrong defined categories found. To get this sorted, read:"
        puts 'https://about.gitlab.com/handbook/marketing/blog/#categories'

        exit count
      else
        puts 'All posts have correct categories!'
      end
    end

    desc "Disallow new Unfiltered blog posts past 2021-05-20"
    task :unfiltered do
      puts ''
      puts '=> Checking if any new unfiltered posts have been added since 2021-05-20...'

      YAML_FRONT_MATTER_REGEXP = /\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)/m

      # The 2021-05-20 date was decided here: https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests/82453#note_578816822
      # But we can change the date in this constant if need be. Use the ISO 8601 format in the line below to create a different date as needed.
      UNFILTERED_DEPRECATION_DATE = Date.strptime('2021-05-20')

      # Iterate through all the source files in the blog directory.
      Dir[File.expand_path('../../sites/uncategorized/source/blog/blog-posts/*', __dir__)].each do |post|
        # Get the date of the post
        # This line just gets the first instance of an ISO 8601 formatted date in the file name,
        # so a file can get past this detection by prepending a passing date before the failed date.
        # But anyone with the permissions to do so could just mis-label their post anyways.
        # This check is meant to lint for people making mistakes, rather than to protect us from intentional rule breaking.
        file_path_date = post.scan(/\d{4}-\d{2}-\d{2}/).first

        raise "The filename \"#{post}\" does not include a date in the format YYYY-MM-DD" unless file_path_date

        # If the date is improperly formatted, raise an error about it.
        # This is technically outside of the scope of the lint task,
        # but we need to have valid dates in blog post files anyway,
        # and without one, we couldn't run this comparison.
        begin
          post_date = Date.strptime(file_path_date)
        rescue Date::Error => e
          puts "=> Error in date syntax in #{post}: #{e}"
          raise
        end

        # If the post is from before 2021-05-20, skip the unfiltered check.
        next if post_date < UNFILTERED_DEPRECATION_DATE

        # Otherwise, read the file and get its frontmatter data.
        content = File.read(post)
        data = content.scan(YAML_FRONT_MATTER_REGEXP)&.last&.first

        ## Disable Rubocop due to https://github.com/ruby/psych/issues/262
        ## We only parse the file, so there's no security issue anyway
        # rubocop:disable Security/YAMLLoad
        to_yaml = YAML.load(data)
        # rubocop:enable Security/YAMLLoad

        # If the post category is unfiltered, fail this check and produce an error about it
        next unless to_yaml['categories'] == 'unfiltered'

        puts
        puts "A new Unfiltered post was added at #{post}. GitLab is no longer publishing to the Unfiltered Blog. Read more here: https://about.gitlab.com/handbook/marketing/blog/unfiltered/"
        exit 1
      end

      puts "No unfiltered posts were added past #{UNFILTERED_DEPRECATION_DATE}!"
    end
  end

  desc "Ensure valid format in /data/mvps.yml"
  task :mvps do
    puts ''
    puts '=> Checking if version/name/date in data/mvps.yml are strings...'

    mvps = YAML.load_file(File.expand_path('../../data/mvps.yml', __dir__))

    mvps.each do |mvp|
      version = mvp.fetch('version')

      unless version.is_a?(String)
        puts "Version must be String: #{version} (#{version.class})"
        exit 1
      end

      unless mvp.fetch('name').is_a?(String) || mvp.fetch('name').is_a?(Array)
        puts "MVP's name for #{version} must be String"
        exit 1
      end
      # Some previous releases have more than one MVP
      unless mvp.fetch('gitlab', '').is_a?(String) || mvp.fetch('gitlab', '').is_a?(Array)
        puts "MVP's gitlab username for #{version} must be String"
        exit 1
      end
      unless mvp.fetch('date').is_a?(String)
        puts "MVP's date for #{version} must be String"
        exit 1
      end
      if mvp.fetch('name').is_a?(Array) && mvp.fetch('gitlab', '').is_a?(String)
        puts "MVP's gitlab username must be an array if name is an array"
        exit 1
      end
      if mvp.fetch('name').is_a?(String) && mvp.fetch('gitlab', '').is_a?(Array)
        puts "MVP's name must be an array if username is an array"
        exit 1
      end
    end
  end

  desc "Ensure monorepo structure is valid and there are no unexpected files"
  task :monorepo_structure do
    require_relative '../lint/monorepo_structure'
    Lint::MonorepoStructure.new.run
  end

  desc "Ensure correct redirects in /data/redirects.yml"
  task :redirects_yml do
    Gitlab::Homepage::Redirect.validate_definitions_file!

    puts "✔ #{Gitlab::Homepage::Redirect::DEFNINTIONS_FILE_PATH} valid"
  rescue StandardError => e
    puts "✖ Error validating #{Gitlab::Homepage::Redirect::DEFNINTIONS_FILE_PATH}: #{e}"
    exit 1
  end

  namespace :team_yml do
    desc 'Run all lint tasks for team_yml'
    task all: ['lint:team_yml:pictures',
               # 'lint:team_yml:roles', - Disabled as Job Families has moved out of repo
               'lint:team_yml:types',
               'lint:team_yml:unique',
               'lint:team_yml:unmanaged',
               'lint:team_yml:gitlab_names'] do
               end

    desc "Ensure that people have correct roles"
    task :roles do
      puts ''
      puts '=> Checking if all people in data/team_members have a well defined role'

      roles = Gitlab::Homepage.team.members.flat_map(&:job_families).sort.uniq

      roles.reject! do |role|
        File.exist?(File.expand_path("../../sites/uncategorized/source#{role}", __dir__))
      end

      unless roles.empty?

        puts '----------------------------'
        puts 'Oops! It seems some roles in the data/team_members are not defined:'
        puts roles
        puts 'Please make sure that the roles exist in the sites/uncategorized/source folder.'
        exit 1

      end

      puts 'All the roles in data/team_members are defined!'.green
    end

    desc "Ensure that people on the team page are unique"
    task :unique do
      unique_fields = %i[slug gitlab twitter]
      counters = unique_fields.to_h { |key| [key, Hash.new(0)] }

      puts ''
      puts "=> Checking if all people in data/team_members have unique values for #{unique_fields.join(', ')}"

      members = Gitlab::Homepage.team.members.reject { |m| m.vacancy? || m.acting? }

      members.each do |member|
        unique_fields.each do |key|
          value = member[key]
          counters[key][value] += 1 unless value.nil?
        end
      end

      if counters.values.flat_map(&:values).all? { |n| n == 1 }
        puts 'All persons in data/team_members are unique!'.green
      else
        unique_fields.each do |field|
          not_unique = counters[field].select { |_, count| count > 1 }
          next if not_unique.empty?

          puts '----------------------------'
          puts "Oops! It seems like multiple persons have the same value for '#{field}' on the team page:"
          puts not_unique.keys
          puts "Please check that every person in data/team_members has an unique entry for #{field}."
        end

        exit 1
      end
    end

    desc "Ensure that the pictures referenced in data/team_members exist"
    task :pictures do
      puts ''
      puts '=> Checking if all pictures referenced in data/team_members exist'

      # Team pictures live in the marketing monorepo site under sites/uncategorized/images/team
      no_picture = Gitlab::Homepage.team.members.reject do |person|
        person['picture'] &&
          (
            person['picture'].include?('gitlab-logo-extra-whitespace.png') ||
            File.exist?(File.absolute_path("sites/uncategorized/source/images/team/#{person['picture']}"))
          )
      end

      unless no_picture.empty?

        no_picture = no_picture.map { |person| "\t#{person['name']} => #{person['picture'] || 'No Picture defined'}" }.join("\n")

        puts '----------------------------'
        puts "Oops! It seems like one or multiple pictures referenced on the team page do not exist:"
        puts no_picture
        puts "Check that the 'picture' line in data/team_members matches the file name of a file in 'sites/uncategorized/source/images/team'."
        exit 1
      end

      puts 'All pictures referenced in data/team_members exist!'.green
    end

    desc "Ensure that entries have a valid type"
    task :types do
      puts ''
      puts '=> Checking if all entries in data/team_members have a valid type'

      valid_types = %w[person vacancy]
      invalid_types = Gitlab::Homepage.team.members.reject { |m| valid_types.include?(m.type) }

      unless invalid_types.empty?
        message = invalid_types.map { |entry| "\t#{entry.name} => #{entry.type}" }.join("\n")

        puts '----------------------------'
        puts 'Oops! It seems some entries in data/team_members have invalid types:'
        puts message
        puts 'Please make sure that the type is "person" or "vacancy". We currently do not add pets on the team page'
        exit 1
      end

      puts 'All entries in data/team_members have a valid type!'.green
    end

    desc "Ensure that reports_to values exist where expected"
    task :unmanaged do
      puts ''
      puts '=> Checking if reports_to values in data/team_members exist where expected'

      unmanaged = Gitlab::Homepage.team.members.reject(&:managed?)

      unless unmanaged.empty?
        message = unmanaged.map { |entry| "\t#{entry['name']} (#{entry['slug']})" }.join("\n")

        puts '----------------------------'
        puts 'Oops! It seems some entries in data/team_members are missing a "reports_to" value:'
        puts message
        puts 'Please make sure that the "reports_to" field is not empty.'
        exit 1
      end

      puts 'All reports_to values in data/team_members exist where expected!'.green
    end

    desc "Ensure that entries have a gitlab username"
    task :gitlab_names do
      puts ''
      puts '=> Checking if all entries in data/team_members have a GitLab username'

      IGNORED_DEPARTMENTS = ['Board', 'Advisors', 'Board Observers'].freeze

      invalid_entries = Gitlab::Homepage.team.members.reject do |entry|
        entry.gitlab.present? || entry.in_department?(*IGNORED_DEPARTMENTS) || entry.vacancy?
      end

      unless invalid_entries.empty?
        message = invalid_entries.map { |entry| "\t#{entry['name']}" }.join("\n")

        puts '----------------------------'
        puts 'Oops! It seems some entries in data/team_members/people do not have a GitLab username'.red
        puts message
        puts 'Please make sure that the "gitlab" field is not empty.'.yellow
        exit 1
      end

      puts 'All entries in data/team_members/people have a GitLab username!'.green
    end
  end

  namespace :categories_yml do
    desc "Ensure that people have correct roles"
    task :links do
      require_relative '../categories/categories_yml_link_checker'
      Categories::CategoriesYmlLinkChecker.new.run
    end
  end

  desc 'Ensure that codeowners file is correct'
  task :codeowners do
    require_relative '../code_owners'
    Gitlab::CodeOwners.run_linter
  end

  desc "Check that all docs point to /ee/"
  task :docs_ee do
    puts ''
    abort unless system(File.expand_path('../../scripts/docs_ee_check.sh', __dir__))
    puts ''
  end

  namespace :inclusiveness do
    desc "Ensure that job families use inclusive language"
    task :check do
      require_relative '../lint/inclusiveness_check'
      Lint::InclusivenessCheck.new.run
    end
  end

  namespace :speakers_yml do
    desc "Ensure that speakers on the speakers page are unique"
    task :unique do
      file = YAML.load_file(File.expand_path('../../data/speakers.yml', __dir__))
      unique_fields = %w[name gitlab twitter]

      unique_fields.each do |field|
        puts ''
        puts "=> Checking if all people in data/speakers.yml have a unique #{field} value"

        names = Hash.new(0)

        values = file.each_with_object(Hash.new(0)) do |person, sum|
          name = person['name']
          value = person[field]

          next if value.nil?
          # Allow gitlab name duplicates for people with multiple roles
          # TODO: https://gitlab.com/gitlab-com/www-gitlab-com/-/issues/8079
          next if field == 'gitlab' && names.key?(name)

          names[name] += 1
          sum[value] += 1
        end

        not_unique = values.select { |_, count| count > 1 }.keys

        next if not_unique.empty?

        puts '----------------------------'
        puts "Oops! It seems like multiple persons have the same value for '#{field}' on the speakers page:"
        puts not_unique
        puts "Please check that every person in data/speakers.yml has an unique entry."
        exit 1
      end

      puts 'All persons in data/speakers.yml are unique!'
    end

    desc "Ensure that the pictures referenced in data/speakers.yml exist"
    task :pictures do
      puts ''
      puts '=> Checking if all pictures referenced in data/speakers.yml exist'

      file = YAML.load_file(File.expand_path('../../data/speakers.yml', __dir__))
      # Team pictures live in the source/images/speakers
      no_picture = file.reject { |person| person['image'] && File.exist?(File.absolute_path("source/images/speakers/#{person['image']}")) }

      unless no_picture.empty?

        no_picture = no_picture.map { |person| "\t#{person['name']} => #{person['picture'] || 'No Picture defined'}" }.join("\n")

        puts '----------------------------'
        puts "Oops! It seems like one or multiple pictures referenced on the speakers page do not exist:"
        puts no_picture
        puts "Check that the 'picture' line in data/speakers.yml matches the file name of a file in 'source/images/speakers'."
        exit 1
      end

      puts 'All pictures referenced in data/speakers.yml exist!'
    end

    desc "Ensure that entries have a valid region"
    task :region do
      file = YAML.load_file(File.expand_path('../../data/speakers.yml', __dir__))
      requirements = YAML.load_file(File.expand_path('../../data/speakers_requirements.yml', __dir__))
      puts ''
      puts '=> Checking if all entries in data/speakers.yml have a valid region'

      valid_regions = requirements['regions']
      invalid_regions = file.reject { |entry| valid_regions.include? entry['region'] }

      unless invalid_regions.empty?
        message = invalid_regions.map { |entry| "\t#{entry['name']} => #{entry['region']}" }.join("\n")

        puts '----------------------------'
        puts 'Oops! It seems some entries in data/speakers.yml have invalid regions:'
        puts message
        puts ''
        exit 1
      end

      puts 'All entries in data/speakers.yml have a valid region!'
    end

    desc "Ensure that entries have valid topics"
    task :topics do
      file = YAML.load_file(File.expand_path('../../data/speakers.yml', __dir__))
      requirements = YAML.load_file(File.expand_path('../../data/speakers_requirements.yml', __dir__))
      puts ''
      puts '=> Checking if all entries in data/speakers.yml have valid topics'

      valid_topics = requirements['topics']
      invalid_topics = file.reject { |entry| (entry['topics'] - valid_topics).empty? }

      unless invalid_topics.empty?
        message = invalid_topics.map { |entry| "\t#{entry['name']} => #{entry['topics'] - valid_topics}" }.join("\n")

        puts '----------------------------'
        puts 'Oops! It seems some entries in data/speakers.yml have invalid topics:'
        puts message
        puts ''
        exit 1
      end

      puts 'All entries in data/speakers.yml have valid topics!'
    end

    desc "Ensure that entries have a gitlab username"
    task :gitlab_names do
      file = YAML.load_file(File.expand_path('../../data/speakers.yml', __dir__))
      puts ''
      puts '=> Checking if all entries in data/speakers.yml have a GitLab username'

      invalid_entries = file.reject do |entry|
        entry['gitlab'].present?
      end

      unless invalid_entries.empty?
        message = invalid_entries.map { |entry| "\t#{entry['name']}" }.join("\n")

        puts '----------------------------'
        puts 'Oops! It seems some entries in data/speakers.yml do not have a GitLab username'.red
        puts message
        puts 'Please make sure that the "gitlab" field is not empty.'.yellow
        exit 1
      end

      puts 'All entries in data/speakers.yml have a GitLab username!'.green
    end

    desc "Ensure that entries have a tagline with the correct length"
    task :tagline do
      max_length = 118
      file = YAML.load_file(File.expand_path('../../data/speakers.yml', __dir__))
      puts ''
      puts "\=> Checking if all entries in data/speakers.yml have a tagline less than #{max_length} characters"

      # invalid_entries = file.reject do |entry|
      #   entry['tagline'].length > 118
      # end
      invalid_entries = file.reject { |entry| entry['tagline'].length < max_length }

      unless invalid_entries.empty?
        message = invalid_entries.map { |entry| "\t#{entry['name']} => #{entry['tagline'].length}" }.join("\n")

        puts '----------------------------'
        puts "Oops! It seems some entries in data/speakers.yml do not have a tagline less than #{max_length} characters".red
        puts message
        puts "Please make sure that the 'tagline' field is not over #{max_length} characters.".yellow
        exit 1
      end

      puts "All entries in data/speakers.yml have a tagline less than #{max_length} characters!".green
    end
  end

  desc 'Lint Netlify CMS files with yamllint'
  task :netlifycms do
    puts ''
    puts '=> Lint all YAML files under sites/uncategorized/source/admin with yamllint'

    if system('which yamllint')
      cmd = 'yamllint --config-file .yamllint.yml sites/uncategorized/source/admin'
      raise "command failed: #{cmd}" unless system(cmd)
    else
      puts '`yamllint` is not installed. Please install via `brew` or `apt`'
    end
  end
end
