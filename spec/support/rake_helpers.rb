# frozen_string_literal: true

require 'rake'

module RakeHelpers
  def run_rake_task(task_name, *args)
    Rake::Task[task_name].reenable
    Rake.application.invoke_task("#{task_name}[#{args.join(',')}]")
  end
end
