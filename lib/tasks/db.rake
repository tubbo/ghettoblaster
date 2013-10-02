namespace :db do
  task :user do
    sh 'createuser -s ghettoblaster'
  end
end

task :db => %w(db:user db:setup)
