module Gitlab
  module Homepage
    class Team
      class DomainExpertise
        include Comparable
        attr_reader :key

        def initialize(key, data)
          @key = key
          @data = data
        end

        def self.all!
          @domain_expertise ||= YAML.load_file(File.expand_path('../../data/domain_expertise.yml', __dir__))

          @domain_expertise.map do |key, data|
            new(key, data).tap { |domain| yield domain if block_given? }
          end
        end

        def display_name
          @data.fetch("display_name")
        end

        def link
          @data.fetch("link")
        end

        ##
        # Middeman Data File objects compatibility
        #
        def method_missing(name, *args, &block) # rubocop:disable Style/MethodMissingSuper
          @data[name.to_s]
        end

        def respond_to_missing?(method_name, include_private = false)
          @data.include?(method_name.to_s) || super
        end
      end
    end
  end
end
