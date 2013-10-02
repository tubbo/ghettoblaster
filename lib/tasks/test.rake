begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :test
rescue LoadError
  Rails.logger.debug "RSpec task not loaded"
end
