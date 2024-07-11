module EditLinkHelper
  # Returns `sites/<site>` if page lives in a monorepo site, empty string if not
  def monorepo_site_path_fragment
    monorepo_site = nil
    current_page_relative_path = current_page.file_descriptor.relative_path.to_s
    monorepo_data = data.monorepo.to_h

    monorepo_data.each do |site, entry|
      # If the current_page relative_path matches a shared file, it isn't under the site.
      # It's important that this check come first, because some paths (e.g. direction)
      # need to be (for middleman reasons) under both paths and shared files, but aren't
      # actually under the site
      matches_shared_file = entry['shared_files'].any? do |shared_file|
        shared_file_regex = /^#{shared_file}/
        current_page_relative_path.match?(shared_file_regex)
      end
      next if matches_shared_file

      # If it matches a site path regex, it's under the site
      entry['paths'].each do |path|
        site_path_regex = /^#{path}/
        if current_page_relative_path.match?(site_path_regex)
          monorepo_site = site
        end
      end
    end
    monorepo_site ? "sites/#{monorepo_site}/" : ''
  end
end
