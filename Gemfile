source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '~> 3.2'
gem 'pg'
gem 'json'
gem 'jquery-rails'
gem "haml"
gem "activeadmin"
gem 'inherited_resources', '~> 1.4'
gem "redcarpet"
gem 'puma'
gem 'airbrake'
gem 'sidekiq'
gem 'rakeflow'
gem 'strong_parameters'
gem 'foreman'
gem 'resque'
gem 'resque_mailer'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'zurb-foundation', '~> 4.0'
end

group :development do
  gem "haml-rails"
  gem "ruby_parser"
  gem "hpricot"
  gem "travis"
end

group :test do
  gem 'rspec-rails'
  gem 'capybara', '~> 2.0.3', :require => false
  gem 'sauce', '~> 3.1.1'
  gem 'sauce-connect'
  #gem 'resque-spec'
end

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'quiet_assets'
end

group :production do
  gem 'rails_12factor'
  gem 'rack-cache'
  gem 'redis-rails'
end
