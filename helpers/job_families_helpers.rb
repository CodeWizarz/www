require 'padrino-helpers'
require 'active_support/core_ext/string/inflections'
require 'active_support/ordered_hash'

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.acronym 'VP'
end

module JobFamiliesHelpers
  include Padrino::Helpers

  def job_families(roles_dir = nil)
    parent_dir = "job-families"
    parent_dir += "/#{roles_dir}" if roles_dir

    job_families_root_dir = File.expand_path("../sites/uncategorized/source/#{parent_dir}", __dir__)

    job_families_dirs = Dir.glob("#{job_families_root_dir}/**/*") # get all files below current dir

    just_directories = job_families_dirs.select do |f|
      File.directory?(f) # only directories we need
    end.sort

    relative_dirs = just_directories.map do |path|
      relative_path = path.gsub(%r{#{job_families_root_dir}/}, '')
      relative_path.split '/' # split to parts
    end
    # rubocop: disable Style/EachWithObject
    nested_dirs = relative_dirs.inject(ActiveSupport::OrderedHash.new) do |acc, path|
      # start with empty hash
      path.inject(acc) do |acc2, dir|
        # for each path part, create a child of current node
        acc2[dir] ||= ActiveSupport::OrderedHash.new # and pass it as new current node
      end
      acc
    end
    # rubocop: enable Style/EachWithObject

    hash_list_tag(nested_dirs, "/#{parent_dir}")
  end

  def hash_list_tag(nested_dirs, parent_dir)
    content_tag(:ul) do
      ul_contents = ""
      nested_dirs.each do |dir, children|
        path = "#{parent_dir}/#{dir}"
        link_text = dir.tr('-', ' ').titleize
        link = link_to(link_text, path)
        li = content_tag(:li, link)
        ul_contents << li
        ul_contents << hash_list_tag(children, path)
      end

      ul_contents.html_safe
    end.html_safe
  end
end
