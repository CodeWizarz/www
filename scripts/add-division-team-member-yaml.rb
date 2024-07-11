#!/usr/bin/env ruby
# frozen_string_literal: true

require 'date'
require 'yaml'

Dir['data/team_members/person/**/*.yml'].each do |path|
  member = YAML.load_file(path, permitted_classes: [Date])

  department = [
    'Customer Support',
    'Development',
    'Development Department',
    'Engineering Function',
    'Incubation Engineering Department',
    'Infrastructure',
    'Infrastructure Department',
    'Product',
    'Product Function',
    'Product Management',
    'Quality',
    'Quality Department',
    'Security',
    'Security Assurance',
    'Security Department',
    'UX'
  ].find do |department|
    member.dig('departments')&.include?(department)
  end

  next unless department

  member_array = member.to_a
  departments_index = member_array.index { |(key, _)| key == 'departments' }

  division =
    case department[/\A\w+/].downcase
    when 'customer', 'development', 'engineering',
      'incubation', 'infrastructure', 'quality'
      'engineering'
    when 'product', 'ux'
      'product'
    when 'security'
      'security'
    end

  member_array.insert(departments_index, ['division', division])

  File.write(path, YAML.dump(member_array.to_h))
end
