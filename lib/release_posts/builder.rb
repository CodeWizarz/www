module ReleasePosts
  class Builder
    include Helpers

    def auto_build
      unless Release.assembly_date?
        puts "Skipping. Assembly date is not today."
        exit 1
      end

      puts "Fetching branches"
      git_fetch

      next_release = detect_next_release

      unless next_release
        puts "Release branch is missing!"
        exit 1
      end

      puts "Detected release: #{next_release}"

      puts 'Set username and email'
      git_config('user.email', 'job+bot@gitlab.com')
      git_config('user.name', 'Bot')

      puts "Switching branch to #{next_release}"
      git_change_branch(next_release)

      puts "Merge latest changes from #{next_release}"
      git_merge("origin/#{next_release}")

      puts "Merge latest changes from master"
      git_merge('origin/master')

      puts "Assembling blog post"
      Post.new.assemble

      puts "Push changes back to the branch"
      git_push("https://jobbot:#{ENV.fetch('GITLAB_BOT_TOKEN')}@gitlab.com/gitlab-com/www-gitlab-com.git", next_release)
    end

    private

    def fetch_release_branches
      (git_branch_list('origin/release-*') || '').split
    end

    def detect_next_release
      fetch_release_branches
        .select { |name| name =~ %r{\Aorigin/release-\d+-\d+\Z} }
        .map { |name| name.delete_prefix('origin/') }
        .max_by { |name| sort_by_version(name) }
    end

    def sort_by_version(release)
      version = release.match(/(\d+)-(\d+)/)
      [version[1].to_i, version[2].to_i]
    end
  end
end
