# frozen_string_literal: true

module ReleasePosts
  module Helpers
    Abort = Class.new(StandardError)
    Done = Class.new(StandardError)

    RP_LABEL_PREFIX = 'release post item::'
    RP_DRAFTED_LABEL = "#{RP_LABEL_PREFIX}in review"

    Type = Struct.new(:name, :description, :label)
    TYPES = [
      Type.new('primary', 'Primary feature', "#{RP_LABEL_PREFIX}primary"),
      Type.new('secondary', 'Secondary feature', "#{RP_LABEL_PREFIX}secondary"),
      Type.new('top', 'Top feature', "#{RP_LABEL_PREFIX}top")
    ].freeze

    MAX_FILENAME_LENGTH = 99 # GNU tar has a 99 character limit
    DEFAULT_BRANCH = 'master'
    GITLAB_PROJECT_ID = 278964

    def capture_stdout(cmd)
      IO.popen(cmd, &:read)
    end

    def log_info(message, detail = nil)
      $stdout.puts "\e[34minfo\e[0m: #{message}"
      $stdout.puts detail if detail
    end

    def log_success(message, detail = nil)
      $stdout.puts "\e[32msuccess\e[0m: #{message}"
      $stdout.puts detail if detail
    end

    def log_warning(message, detail = nil)
      $stdout.puts "\e[33mwarning\e[0m: #{message}"
      $stdout.puts detail if detail
    end

    def log_error(message, detail = nil)
      $stdout.puts "\e[31merror\e[0m: #{message}"
      $stdout.puts detail if detail
    end

    def fail_with(message)
      raise Abort, "\e[31mfatal\e[0m: #{message}"
    end

    def git_add(src)
      capture_stdout(['git', 'add', src])
    end

    def git_config(key, value)
      capture_stdout(['git', 'config', key, value])
    end

    def git_unset_config(key)
      capture_stdout(['git', 'config', '--unset', key])
    end

    def git_fetch
      capture_stdout(%w[git fetch])
    end

    def git_merge(branch)
      capture_stdout(['git', 'merge', '--no-ff', '--no-edit', branch])
    end

    def git_commit(message)
      capture_stdout(['git', 'commit', '--message', message])
    end

    def git_push(path, branch)
      capture_stdout(['git', 'push', path, "HEAD:#{branch}"])
    end

    def git_mv(src, dst)
      capture_stdout(['git', 'mv', src, dst])
      $stdout.puts "\e[34mmoved\e[0m #{src} to #{dst}"
    end

    def replace(old, new, file)
      expr = "%s##{old}##{new}#|x"
      $stdout.puts "\e[34mchanged\e[0m #{old} path to #{new} in #{file}"
      capture_stdout(['ex', '-sc', expr, file])
    end

    def git_change_branch(branch)
      capture_stdout(['git', 'checkout', branch])
    end

    def git_current_branch
      capture_stdout(%w[git symbolic-ref --short HEAD]).strip
    end

    def git_branch_list(pattern)
      capture_stdout(['git', 'branch', '-r', '--list', pattern])
    end

    def git_repo_path
      capture_stdout(%w[git rev-parse --show-toplevel]).strip
    end
  end
end
