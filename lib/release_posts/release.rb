require 'yaml'
require 'date'

module ReleasePosts
  class Release
    RELEASES_FILE = File.expand_path('../../data/releases.yml', File.dirname(__FILE__))
    DAYS_FROM_RELEASE_TO_ASSEMBLY = 4

    def initialize
      @releases = YAML.load_file(RELEASES_FILE)
    end

    attr_reader :releases

    def current
      @releases.find do |release|
        this_year == release_year(release['date']) &&
          this_month == release_month(release['date'])
      end
    end

    def self.current
      new.current
    end

    def self.assembly_date?
      Date.today == Date.parse(new.current['date']) - DAYS_FROM_RELEASE_TO_ASSEMBLY
    end

    private

    def this_month
      Date.today.month
    end

    def this_year
      Date.today.year
    end

    def release_date(date_string)
      Date.parse(date_string)
    end

    def release_month(date_string)
      release_date(date_string).month
    end

    def release_year(date_string)
      release_date(date_string).year
    end
  end
end
