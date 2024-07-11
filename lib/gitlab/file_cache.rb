require 'active_support/cache'

module Gitlab
  module FileCache
    CACHE_VERSION = 'v3'.freeze

    module ClassMethods
      def set_cache_store(name)
        @cache_store_name = name
      end

      def cache_store_name
        @cache_store_name || name
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end

    def cached(cache_key)
      logger = ::Middleman::Logger.singleton
      entry = cache_store.read(cache_key)

      if entry
        logger.info("== #{self.class.cache_store_name.titleize}: #{cache_key} (cached)")

        return entry
      end

      logger.info("== #{self.class.cache_store_name.titleize}: #{cache_key} (not cached)")

      catch(:abort_cache) do
        result = yield

        cache_store.write(cache_key, result)

        result
      end
    end

    # Abort the cache operation returning a value and not saving result to the cache
    def abort_cache!(return_value)
      throw :abort_cache, return_value
    end

    def cache_store
      @cache_store ||= ActiveSupport::Cache::FileStore.new(
        File.expand_path("../../tmp/cache/#{CACHE_VERSION}/#{self.class.cache_store_name}", __dir__),
        expires_in: 4.hours.to_i
      )
    end
  end
end
