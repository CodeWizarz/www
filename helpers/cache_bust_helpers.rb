require 'json'

# A helper module to provide cache busting utilities to templates in Middleman,
# or any other Ruby-based static site generator.
module CacheBustHelpers
  # @return [String] memoized cache bust value, or calls get_cache_bust_value_from_git if need be
  def cache_bust_value
    @cache_bust_value ||= get_cache_bust_value_from_git
  end

  # @return [String] The value of the latest git hash in the repository, stripped.
  def get_cache_bust_value_from_git
    `git rev-parse --short HEAD`.strip
  end

  # Given an input string and a cache busting value, this method will return a
  # string that injects the cache_bust_value as a query parameter.
  #
  # This method checks that the string to be modified contains `.css` or `.js`.
  # It will raise an error if it doesn't (or if the value is not a string).
  # If those conditions are satisfied, it will attempt to inject the query parameter after `.css` or `.js`.
  #
  # @param [String] string The string to be modified.
  # @param [String] cache_bust_value The cache busting value.
  # @return [String] The modified string.
  def cache_bust(string, cache_bust_value)
    raise 'The argument provided to the CacheBustHelpers is not a string' unless string.is_a?(String)
    raise 'The string provided to the CacheBustHelpers does not contain `.css` or `.js`' unless string.include?('.css') || string.include?('.js')

    css_index = string.index('.css')
    js_index = string.index('.js')

    cache_bust_parameter = "?cacheBust=#{cache_bust_value}"

    return string.insert(css_index + 4, cache_bust_parameter) if css_index
    return string.insert(js_index + 3, cache_bust_parameter) if js_index
  end
end
