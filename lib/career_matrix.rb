require 'csv'

module Gitlab
  module Homepage
    class CareerMatrix
      def self.engineering_ic
        new(YAML.load_file(File.expand_path('../data/engineering_ic_career_matrix.yml', __dir__)))
      end

      def levels
        @data.map { |l| l['name'] }
      end

      def categories
        @data[0].keys[1..-1]
      end

      def behaviours_for(category)
        @data[0][category].keys
      end

      def descriptions_for(level, category, behaviour)
        level_data = @data.find { |l| l['name'] == level }
        level_data[category][behaviour] || []
      end

      def as_csv
        CSV.generate do |csv|
          csv << ['Behaviours'] + levels
          categories.each do |category|
            behaviours_for(category).each do |behaviour|
              row = ["#{category}: #{behaviour}"]
              levels.each do |level|
                row << descriptions_for(level, category, behaviour).join("\n")
              end

              csv << row
            end
          end
        end
      end

      private

      def initialize(data)
        @data = data
      end
    end
  end
end
