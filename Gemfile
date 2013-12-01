source 'https://rubygems.org'
ruby '2.0.0'

group :framework do
  gem 'rails', '~> 4.0'
  gem 'pg'
  gem 'puma'
end

group :engines do
  gem 'zen_garden'
  gem 'redis-rails'
  gem 'devise', '~> 3.2'
end

group :libraries do
  gem 'redcarpet'
  gem 'foreman'
  gem 'resque'
  gem 'resque_mailer'
end

group :assets do
  gem 'jquery-rails', '~> 2.2'
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier', '>= 1.0.3'
  gem 'foundation-rails'
  gem 'ember-rails', \
    github: 'emberjs/ember-rails',
    branch: 'master'
  gem 'ember_script-rails', \
    github: 'ghempton/ember-script-rails',
    branch: 'master'
  gem 'emblem-rails'
end

group :development do
  gem 'meta_request'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara', '~> 2.0', :require => false
  gem 'resque_spec'
  gem 'poltergeist'
end

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'quiet_assets'
end

group :production do
  gem 'rails_12factor'
  gem 'rack-cache'
  gem 'airbrake'
end
