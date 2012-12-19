    require 'rspec/core/rake_task'
    RSpec::Core::RakeTask.new :spec

    task :test => ['db:test:prepare', 'spec']

    task :server do
      sh "rails server puma"
    end
