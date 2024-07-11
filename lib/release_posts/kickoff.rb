# frozen_string_literal: true

require 'yaml'
require 'fileutils'
require 'rest-client'
require_relative 'milestones'

module ReleasePosts
  class Kickoff
    attr_accessor :version, :date, :release_post_manager, :release_post_manager_name, :rpm_shadow, :tw_lead, :tech_advisor, :pmm_lead

    def initialize(row)
      @version = row["version"]
      @date = row["date"]
      @release_post_manager = row["manager"]
      @release_post_manager_name = row["manager-name"]
      @rpm_shadow = row["manager-shadow"]
      @tw_lead = row["structural_check"]
      @tech_advisor = row["technical_advisor"]
      @pmm_lead = row["messaging"]
    end
  end
end
