require 'yaml'

module Categories
  class CategoriesYmlLinkChecker
    def run(categories_yml_path = nil)
      log "Running categories.yml Link Checker..."

      categories = load_categories_yml(categories_yml_path)

      bad_category_messages = categories.values.flat_map do |category|
        [
          check_documentation_link(category),
          check_direction_link(category)
        ].compact
      end

      log "\n"
      if bad_category_messages.empty?
        log "SUCCESS: categories.yml links are valid, no bad categories found."
      else
        err_msg = "ERROR: categories.yml had #{bad_category_messages.length} bad categories"
        log "#{err_msg}:\n"
        bad_category_messages.each_with_index do |msg, i|
          log "#{i + 1}. #{msg}"
        end
        log "\n"
        raise err_msg
      end
    end

    private

    def check_documentation_link(category)
      return unless category['maturity'] && category['marketing']
      return unless category['maturity'] != 'planned' && !category['documentation']

      bad_category(category, "'#{category['maturity']}' maturity with no documentation link")
    end

    def check_direction_link(category)
      return unless category['direction']

      return if category['direction'].start_with?('/')
      return if category['direction'].start_with?('https://internal.gitlab.com')

      bad_category(category, "'#{category['direction']}' direction must be relative or link internal handbook")
    end

    def load_categories_yml(categories_yml_path)
      categories_yml_path ||= File.expand_path('../../data/categories.yml', __dir__)
      categories = YAML.load_file(categories_yml_path)
      categories
    end

    def bad_category(category, reason)
      "Bad Category: '#{category['name']}': #{reason}."
    end

    def log(msg)
      puts msg
    end
  end
end
