require 'kramdown'

module ProductCategoryHelpers
  NAME_REGEX = /^(.+?)\s*(\(.+?\))?$/.freeze

  def category_groups
    @category_groups ||= data.stages.stages.flat_map do |_, stage|
      Array(stage.groups).flat_map do |_, group|
        Array(group.categories).map { |category| [category, group] }
      end
    end.to_h
  end

  def category_group_link(category_slug)
    if group = category_groups[category_slug]
      "[#{group.name}](##{group_id(group)})"
    else
      'Not owned'
    end
  end

  def display_users_group(label, group, pluralize: true)
    group = Array(group)

    return '' if group.none?

    output = pluralize ? label.pluralize(group.count) : label

    "#{output}: " + group.uniq.map { |member| member_placeholder(member) }.join(", ")
  end

  def member_placeholder(member)
    match = member.match(NAME_REGEX)

    if match
      name, status = match.captures

      return "[#{name}] #{status}" if status.present?
    end

    "[#{member}]"
  end

  def group_id(group)
    Kramdown::Converter::Base.send(:new, nil, nil).basic_generate_id("#{group.name} group")
  end
end
