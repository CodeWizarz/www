require 'padrino-helpers'

module BreadcrumbsHelper
  include Padrino::Helpers

  def breadcrumbs(page, wrapper: :li, separator: '', hide_home: true, convert_last: false)
    hierarchy = parents(page)

    hierarchy.collect.with_index do |page_v, i|
      if show_page?(page_v, hide_home)
        if convert_last_to_link?(i, hierarchy.size, convert_last)
          content_tag(:li, page_v.data.title || page_v.metadata[:title])
        else
          wrap(link_to(page_v.data.title, page_v.url.to_s), wrapper: wrapper)
        end
      end
    end.join(h(separator))
  end

  private

  def parents(page)
    current_page = page
    hierarchy = []

    while current_page
      hierarchy.unshift(current_page)
      current_page = parent(current_page)
    end

    hierarchy
  end

  def parent(page)
    @parent_hash ||= Hash.new do |hash, key|
      hash[key] = key.parent
    end

    @parent_hash[page]
  end

  def wrap(content, wrapper: nil)
    wrapper ? content_tag(wrapper) { content } : content
  end

  def show_page?(page, hide_home)
    return true unless hide_home
    return true unless page.request_path == 'index.html'

    false
  end

  def convert_last_to_link?(page_index, size, convert_last)
    return false if convert_last
    return true if (page_index + 1) == size

    false
  end
end
