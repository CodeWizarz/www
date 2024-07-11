require 'json'
require 'yaml'

require_relative '../lib/team/yaml'

# Loads data/team.yml and generates JSON data to plot the organization chart.
class OrgChart
  attr_reader :yaml, :org

  def initialize(yaml = ::Gitlab::Homepage::Team::Yaml.new)
    @yaml = yaml
    @org = yaml.org_chart
  end

  def validate!
    yaml.verify_members!
  end

  def team_data
    validate!

    @team_data ||= build_json_data
  end

  def team_data_tree
    validate!

    @team_data_tree ||= org.forest.map { |tree| from_tree(tree) }
  end

  private

  def from_tree(tree)
    member(tree.member).merge(
      children: tree.reports.map { |r| from_tree(r) },
      direct_reports_count: tree.direct_count,
      vacant_reports_count: tree.vacancies,
      descendents: tree.total_count
    )
  end

  def build_json_data
    # Build only the data we need
    org.forest.flat_map(&:to_list).map do |tree|
      entry = tree.member
      reports_to = entry['reports_to']

      # This needs to match the implementation of Gitlab::Homepage::Team::Member#anchor
      member(tree.member).merge(
        speciality: entry.fetch('speciality', nil),
        placeholder: entry.fetch('placeholder', false),
        direct_reports_count: tree.direct_count,
        vacant_reports_count: tree.vacancies,
        lead: org.nodes[reports_to]
      )
    end
  end

  def member(entry)
    {
      anchor: entry['gitlab'] || entry['slug'],
      slug: entry['slug'],
      name: entry['name'],
      link: entry['role'],
      type: entry['type']
    }
  end
end
