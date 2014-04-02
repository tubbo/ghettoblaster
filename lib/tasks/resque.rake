require 'resque/tasks'

namespace :resque do
  task :setup => :environment do
    # work all queues at once
    ENV['QUEUE'] = "*"
  end
end
