require 'linter'

module Lint
  class InclusivenessCheck
    ERROR_MESSAGE = <<~MSG.freeze

      ERROR: Inclusiveness check failed.

      ---------------------------------
      Please fix the following messages by changing the wording. You're not asked
      to change all the flagged words, it's more important to find a balance.

      If you need help with suggestions for changing some of the
      wording, you can find more information on the handbook page:
      https://about.gitlab.com/handbook/hiring/job-families/#inclusive-language-check.

      If the check finds a false positive, you can add the file to this skip list:
      https://gitlab.com/gitlab-com/www-gitlab-com/-/blob/master/data/inclusiveness_check.yml.
      The files in this list are ignored by the inclusiveness check.
      ---------------------------------

      The changes to the following file(s) are not inclusive:
    MSG

    def run
      log "Running inclusiveness check..."
      bad_file_messages = []

      files.each do |file_name|
        next unless file_name.include?('job-families') # we currently only want to enforce this on job families

        text = File.read(file_name)
        response = Linter.analyze(text, job_ad: true)
        parsed_response = parse_response(response, file_name)

        any_files_skipped = any_files_skipped?(file_name)

        next if any_files_skipped && parsed_response.any?

        if any_files_skipped
          bad_file_messages << "File #{file_name} is on the skipped list in data/inclusiveness_check.yml, but is no longer failing the inclusiveness check. Please remove it."
        end

        bad_file_messages << parsed_response if parsed_response.any?
      end

      if bad_file_messages.empty?
        log "Success: All files are fine"
      else
        log "#{ERROR_MESSAGE}\n"
        bad_file_messages.each_with_index do |msg, i|
          log "#{i + 1}. #{msg}"
        end
        log "\n"
        exit 1
      end
    end

    private

    def files
      root = File.expand_path('../..', __dir__)
      job_family_dir = 'sites/uncategorized/source/job-families'
      Dir.glob("#{root}/#{job_family_dir}/**/*.md")
    end

    def any_files_skipped?(file_name)
      config['skipped'].any? do |skipped_file|
        File.fnmatch?("*/#{skipped_file}", file_name)
      end
    end

    def config
      root = File.expand_path('../..', __dir__)
      @config ||= Psych.load_file(File.expand_path("#{root}/data/inclusiveness_check.yml", __dir__))
    end

    def check_file
      text = File.read(file_name)
      Linter.analyze(text, job_ad: true)
    end

    def parse_response(response, file_name)
      messages = []
      if response[:gender_association_analysis].trend.include?('masculine-coded')
        messages << "ATTENTION: In #{file_name} you're using masculine gender-coded language"
        messages << "Masculine coded words used: #{response[:gender_association_analysis].masculine_coded_word_counts.keys.join(', ')}"
      end

      if response[:pronoun_analysis].trend != 'neutral'
        messages << "ATTENTION: In #{file_name} you're using gendered pronouns"
      end

      # filter out master as this is often used in links to GIT
      # opened an issue on the Ruby Gem to filter out `git language`
      # https://gitlab.com/lienvdsteen/linter/-/issues/14
      misused_words = response[:misused_words_analysis].misused_words.reject { |word| word['word'] == 'master' }
      # filter out ninja for people ops job families as they work with the tool PTO ninja
      misused_words = misused_words.reject { |word| word['word'] == 'ninja' } if file_name.include?('/people-ops/')
      if misused_words.any?
        messages << "ATTENTION: In #{file_name} you're using the following words that are often better replaced:"
        misused_words.each do |word|
          messages << "#{word['word']}: replace with #{word['replace_with'].join(', ')}"
        end
      end

      if response[:mindset_association_analysis].trend.include?('fixed-coded')
        messages << "ATTENTION: In #{file_name} you're using fixed-mindset language"
        messages << "Fixed mindset words used: #{response[:mindset_association_analysis].fixed_coded_word_counts.keys.join(', ')}"
        messages << "Fixed-mindset implies that talents and traits are innate and static. Hiring content that uses growth mindset language can lead to faster hiring times and more hires being made from underrepresented groups. We'd recommend you replace some of the words listed as fixed. You can find some more information in this medium post. https://medium.com/textio/growth-mindset-language-41d51c91432"
      end

      messages
    end

    def log(msg)
      puts msg
    end
  end
end
