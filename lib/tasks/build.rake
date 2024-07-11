# NOTE: This is only intended to be used for local development/testing of builds, to call the same commands which
#       the various CI build jobs call.  We don't try to use these rake tasks in CI from the .gitlab-ci.yml,
#       instead we invoke the commands directly, so that build failures have simpler stacktraces
#       that aren't wrapped in the Rake stack.  It's some duplication for now, we may clean
#       it up later as the monorepo work progresses.

require_relative '../team/yaml'

namespace :build do
  desc "Build the entire site, including all sub-sites"
  task :all do
    run_cmd('rm -rf public')
    run_cmd('mkdir -p public')

    # Build top level
    build_team_yml
    build_images
    build_webpack_assets
    build_assets
    build_handbook_site
    build_uncategorized_site
  end

  desc "Build team.yml"
  task :team_yml do
    build_team_yml
  end

  desc "Verify that the team file is in sync with the team member files"
  task :verify_team do
    verify_team
  end

  desc "Verify that the team directory is sane"
  task :verify_team_members do
    verify_team_members
  end

  desc "Build images"
  task :images do
    build_images
  end

  desc "Build webpack assets"
  task :packaged_webpack_assets do
    build_webpack_assets
  end

  desc "Build assets"
  task :assets do
    build_assets
  end

  desc "Build sites/uncategorized site"
  task :uncategorized do
    build_uncategorized_site
  end

  desc "Build sites/handbook site"
  task :handbook do
    build_handbook_site
  end

  private

  def middleman_build_cmd(env_vars_prefix = '')
    "#{env_vars_prefix} NO_CONTRACTS=#{ENV['NO_CONTRACTS'] || 'true'} middleman build --no-clean --bail"
  end

  def run_cmd(cmd)
    system(cmd) || raise("command failed: #{cmd}")
  end

  def build_images
    puts "\n\nBuilding images..."
    [
      "rsync -qlaP --exclude='/team/' --exclude='.gitkeep' source/images/ public/images"
    ].each do |cmd|
      run_cmd(cmd)
    end
  end

  def yaml
    @yaml ||= Gitlab::Homepage::Team::Yaml.new
  end

  def build_team_yml
    print "\n\nBuilding team.yml..."

    yaml.join

    puts " Wrote #{yaml.file_path}"
  end

  def verify_team_members
    print "\n\nChecking data/team_members..."

    yaml.verify_members!

    puts " OK"
  rescue Gitlab::Homepage::Team::InconsistentTeamError => e
    warn(<<~MSG)
      Team member directory has errors!

      #{e.message}
    MSG

    abort
  end

  def verify_team
    print "\n\nChecking data/team_members entries..."

    yaml.verify_members!
    yaml.verify!

    puts " OK"
  rescue Gitlab::Homepage::Team::BadSlug => e
    warn(e.message)
    abort
  rescue Gitlab::Homepage::Team::InconsistentTeamError => e
    warn(<<~MSG)
      Inconsistent team information!

      #{e.message}

      The team files (under #{yaml.directory}) are not consistent with the
      team database (#{yaml.file_path}).

      The team files are the single source of truth!
      Please do not edit #{yaml.file_path} manually.
    MSG

    abort
  end

  # NOTE: Need to combine the build_packaged_assets and build_assets jobs here and move all /javascripts, /stylesheets, and /ico from /tmp to /public

  def build_webpack_assets
    puts "\n\nBuilding assets with webpack..."
    [
      'yarn install',
      'yarn run build-webpack',
      'mv tmp/dist/stylesheets public/',
      'mv tmp/dist/javascripts public/'
    ].each do |cmd|
      run_cmd(cmd)
    end
  end

  def build_assets
    puts "\n\nBuilding assets..."
    env_vars =
      "DESTINATION_PATH_REGEXES='^ico/' " \
      "MIDDLEMAN_CONFIG_FILE_NAME='config_assets.rb'"
    run_cmd(middleman_build_cmd(env_vars))
  end

  # NOTE: This is slower than just doing a `middleman build` without using PartialBuildHandbook, but
  #       this way is closer to ci and exercises the same logic in PartialBuildHandbook.
  #       If you just want to test something locally, use development mode.  If you want to
  #       test part of a build locally, manually invoke the command with the correct CI_NODE_INDEX
  def build_handbook_site
    puts "\n\nBuilding handbook site from sites/handbook..."

    FileUtils.cd('sites/handbook') do
      (1..2).each do |ci_node_index|
        puts "\n\nBuilding handbook site PartialBuildHandbook for CI_NODE_INDEX=#{ci_node_index}..."
        run_cmd(middleman_build_cmd("CI_NODE_TOTAL=2 CI_NODE_INDEX=#{ci_node_index}"))
      end
    end
  end

  # NOTE: This is slower than just doing a `middleman build` without using PartialBuildUncategorized, but
  #       this way is closer to ci and exercises the same logic in PartialBuildUncategorized.
  #       If you just want to test something locally, use development mode.  If you want to
  #       test part of a build locally, manually invoke the command with the correct CI_NODE_INDEX
  def build_uncategorized_site
    puts "\n\nBuilding uncategorized site from sites/uncategorized..."

    FileUtils.cd('sites/uncategorized') do
      puts "\n\nBuilding uncategorized site PartialBuildUncategorized for proxy resources..."
      run_cmd(middleman_build_cmd("CI_NODE_TOTAL=5 CI_BUILD_PROXY_RESOURCE=true INCLUDE_GENERATORS=true"))

      (1..5).each do |ci_node_index|
        puts "\n\nBuilding uncategorized site PartialBuildUncategorized for CI_NODE_INDEX=#{ci_node_index}..."
        run_cmd(middleman_build_cmd("CI_NODE_TOTAL=5 CI_NODE_INDEX=#{ci_node_index}"))
      end
    end
  end
end
