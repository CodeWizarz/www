require 'yaml'
require 'version_sorter'
require_relative 'releases'

class ReleasePage
  def releases_count
    ::ReleaseList.new.count
  end

  def releases_data
    split_data = { historic_releases: [], upcoming_releases: [] }

    releases_list.each do |data|
      split_data[:historic_releases] << data if data['date'] < current_version['date']
      split_data[:upcoming_releases] << data if data['date'] >= current_version['date']
    end

    split_data
  end

  def current_version
    releases_list
      .find { |release| Date.parse(release['date']) < Date.today }
  end

  def active_version
    current_index = releases_list.index(current_version)
    releases_list[current_index - 1]
  end

  private

  def releases_list
    @releases_list ||= begin
      data = YAML.safe_load(File.read(releases_file))

      VersionSorter.rsort(data) { |data| data['version'] }
    end
  end

  def releases_file
    File.join(File.dirname(__FILE__), '../data/releases.yml')
  end
end
