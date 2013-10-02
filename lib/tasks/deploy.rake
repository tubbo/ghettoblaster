require 'rakeflow'

namespace :deploy do
  include Rakeflow::SSH
  include Rakeflow::Heroku

  task :ssh_configuration do
    write_ssh_config unless ssh_config_exists?
  end

  task :heroku_keys do
    sh 'yes | heroku keys:clear'
    sh 'yes | heroku keys:add'
  end

  task :application_to_heroku do
    sh "git remote add heroku git@heroku.com:#{APP_NAME}.git"
    sh 'git push heroku master'
  end

  desc "Deploy application to Heroku"
  task :to_heroku => %w(
    deploy:ssh_configuration
    deploy:heroku_keys
    deploy:application_to_heroku
  )

  desc "Send Airbrake notification if available"
  task :notify_airbrake do
    Rake::Task['airbrake:deploy'].invoke! if defined? Airbrake
  end
end

desc "Deploy to Heroku and send Airbrake notification if available"
task :deploy => %w(deploy:to_heroku deploy:notify_airbrake)
