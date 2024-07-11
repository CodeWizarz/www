require 'yaml'

module Gitlab
  module Homepage
    class Category
      PLANNED = 'planned'.freeze
      MINIMAL = 'minimal'.freeze
      VIABLE = 'viable'.freeze
      COMPLETE = 'complete'.freeze
      LOVABLE = 'lovable'.freeze

      MATURITY_ORDER = [PLANNED, MINIMAL, VIABLE, COMPLETE, LOVABLE].freeze

      LABEL_PREFIX = 'Category:'.freeze

      attr_reader :key

      def initialize(key, data)
        @key = key
        @data = data
      end

      # rubocop:disable Style/MethodMissingSuper
      # rubocop:disable Style/MissingRespondToMissing

      ##
      # Middeman Data File objects compatibility
      #
      def method_missing(name, *args, &block)
        @data[name.to_s]
      end

      # rubocop:enable Style/MethodMissingSuper
      # rubocop:enable Style/MissingRespondToMissing
      def best_link
        marketing_page || documentation || direction || "/product/#{key.tr('_', '-').downcase}/"
      end

      def features?
        !features.empty?
      end

      def features
        @features ||= Feature.for_category(self)
      end

      def marketing?
        marketing.present?
      end

      def planned?
        maturity == PLANNED
      end

      def unplanned?
        MATURITY_ORDER.include?(maturity) && !planned?
      end

      def maturity_level
        self.class.level(maturity)
      end

      def maturity_level_on_date(date)
        {
          lovable => LOVABLE,
          complete => COMPLETE,
          viable => VIABLE,
          available => MINIMAL
        }.each do |maturity_date, maturity|
          return self.class.level(maturity) if maturity_date&.<= date
        end

        self.class.level(PLANNED)
      end

      def available_before(date)
        available && available <= date
      end

      def available_after(date)
        available && available > date
      end

      def missing_features?
        !missing_features.empty?
      end

      def missing_features
        @missing_features ||= features.dup.keep_if(&:missing?)
      end

      def label
        @data['label'] || "#{LABEL_PREFIX}#{name}"
      end

      def feature_labels
        @data['feature_labels'] || []
      end

      def group
        return @group if defined?(@group)

        found_group = self.class.stages[stage]['groups'].find { |group_key, group_data| group_data.fetch('categories', []).include?(key) }

        @group = found_group ? found_group[0] : nil
      end

      def competitors
        @data['competitors'] || {}
      end

      def self.all!
        @categories ||= YAML.load_file(File.expand_path('../data/categories.yml', __dir__))
        @categories.map do |key, data|
          new(key, data)
        end
      end

      def self.for_stage(stage)
        all!.dup.keep_if { |category| category.stage == stage.key }
      end

      def self.stages
        @stages ||= YAML.load_file(File.expand_path('../data/stages.yml', __dir__))['stages']
      end

      def self.level(maturity)
        MATURITY_ORDER.index(maturity)
      end
    end
  end
end
