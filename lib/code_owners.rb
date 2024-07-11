require 'colorize'
require_relative 'code_owners/file'
require_relative 'code_owners/path_validator'
require_relative 'code_owners/owner_validator'
require_relative 'code_owners/user_presenter'

module Gitlab
  module CodeOwners
    FILE_NAME = 'CODEOWNERS'.freeze
    FILE_PATHS = [FILE_NAME, "docs/#{FILE_NAME}", ".gitlab/#{FILE_NAME}"].freeze

    def self.load_codeowners_file(root)
      @codeowners_file ||= {}

      @codeowners_file[root] ||= begin
        file_path = FILE_PATHS.map { |file_path| ::File.join(root, file_path) }.find { |file_path| ::File.exist?(file_path) }
        raise 'CODEOWNERS file is missing' unless file_path

        CodeOwners::File.new(::File.read(file_path))
      end
    end

    def self.codeowners_for_page(page)
      root = ::File.expand_path('..', __dir__)
      relative_path = Pathname.new(page.source_file).relative_path_from(root).to_s

      load_codeowners_file(root).owners_for_path(relative_path)
    end

    def self.validate(data)
      result = { success: true, errors: {} }

      [OwnerValidator, PathValidator].each do |klass|
        validator = klass.new(data)

        unless validator.valid?
          result[:errors][klass.to_s] = validator.errors
          result[:success] = false
        end
      end

      result
    end

    def self.run_linter
      puts '=> Checking if all entries in .CODEOWNERS are correct'

      file = load_codeowners_file(::File.expand_path('..', __dir__))
      result = validate(file.parsed_data)

      if result[:success]
        puts '✔ .CODEOWNERS valid'.green
      else
        result[:errors].values.flatten.each do |message|
          puts "warning #{message}".yellow
        end

        puts 'Please fix warnings above.'.yellow
        exit 1
      end
    end
  end
end
