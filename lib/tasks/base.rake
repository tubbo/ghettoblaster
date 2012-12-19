begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec
  task :test => ['db:test:prepare', 'spec']
rescue
  puts "Run in development to load RSpec"
end
