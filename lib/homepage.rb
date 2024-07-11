# TODO: Make this not use autoload, because autoload is going away: https://bugs.ruby-lang.org/issues/5653

module Gitlab
  module Homepage
    autoload :Team, 'lib/team'
    autoload :MisusedTerm, 'lib/misused_term'
    autoload :Category, 'lib/category'
    autoload :Group, 'lib/group'
    autoload :Section, 'lib/section'
    autoload :Stage, 'lib/stage'
    autoload :Feature, 'lib/feature'
    autoload :CareerMatrix, 'lib/career_matrix'

    class Team
      autoload :Member, 'lib/team/member'
      autoload :Project, 'lib/team/project'
      autoload :Assignment, 'lib/team/assignment'
      autoload :DomainExpertise, 'lib/team/domain_expertise'
    end

    class Jobs
      autoload :JobsListing, 'lib/jobs/jobs_listing'
      autoload :HiringStatus, 'lib/jobs/hiring_status'
    end

    def self.team
      @team ||= Team.new
    end
  end
end
