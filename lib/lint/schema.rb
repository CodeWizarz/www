# frozen_literal: true

require 'yaml'
require 'set'
require 'json_schemer'

module Lint
  class Schema
    def initialize(schema_path)
      @validator = JSONSchemer.schema(File.read(schema_path))
    end

    def lint(hash)
      result = validator.validate(hash)

      if result.any?
        result.map { |error| decode_json_schemer_errors(error) }
      else
        result
      end
    end

    def lint_yaml(yaml_path)
      lint(YAML.load_file(yaml_path, permitted_classes: [Date]))
    end

    private

    attr_reader :validator

    def decode_json_schemer_errors(error)
      data_path = format_data_pointer error['data_pointer']

      case error['type']
      when 'required'
        keys = error['details']['missing_keys'].join(', ')
        "#{data_path} is missing required keys: #{keys}"
      when 'null',
           'string',
           'boolean',
           'integer',
           'number',
           'array',
           'object'
        "property '#{data_path}' should be of type: #{error['type']}"
      when 'pattern'
        pattern = error['schema']['pattern']
        "property '#{data_path}' does not match pattern: #{pattern}"
      when 'format'
        format = error['schema']['format']
        "property '#{data_path}' does not match format: #{format}"
      when 'enum'
        options = error['schema']['enum']
        "property '#{data_path}' is not one of enum: #{options}"
      else
        "does not validate: error_type=#{error['type']}"
      end
    end

    def format_data_pointer(data_pointer)
      return 'root' if data_pointer.nil? || data_pointer.empty?

      data_pointer
        .sub(%r{^/}, '')   # remove leading /
        .sub('/', '.')     # convert / into .
    end
  end
end
