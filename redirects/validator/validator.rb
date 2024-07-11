#!/usr/bin/env ruby

require 'dry/validation'
require 'yaml'

redirects_file = File.expand_path("../../data/redirects.yml")
redirects = YAML.safe_load(File.open(redirects_file), symbolize_names: true)

class RedirectContract < Dry::Validation::Contract
  config.validate_keys = true

  schema do
    required(:data).filled.array(:hash) do
      required(:sources).filled { array? | str? }
      required(:comp_op).value(included_in?: ['~', '^~', '='])
      required(:target).value(:string).filled
    end
  end

  rule(:data).each do
    # Sources can be a string OR array so we use flatten and apply custom validation logic
    [value[:sources]].flatten.each do |src|
      key.failure("'#{src}' must be a relative path") if src.include? '://'
      key.failure("'#{src}' must start with /") unless src.start_with? '/'
    end

    # Target must start with "http" (absolute) OR "/" (relative)
    key.failure("'#{value[:target]}' not a valid target") unless value[:target].start_with?('http', '/')
  end
end

redirect_contract = RedirectContract.new
validation = redirect_contract.call(data: redirects)

if validation.errors.to_h.empty?
  puts "✅ VALIDATION PASSED FOR #{redirects_file}"
else
  puts "❌ VALIDATION FAILED FOR #{redirects_file}\n\n"

  validation.errors.to_h[:data].each do |line, errors|
    errors.each do |error|
      puts "- Redirect #{line + 1}: #{error}"
    end
  end
end

exit validation.success?
