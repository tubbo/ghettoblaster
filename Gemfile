source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '~> 3.2'
gem 'pg'
gem 'json'
gem 'jquery-rails'
gem "haml"
gem "high_voltage"
gem "simple_form"
gem "activeadmin"
gem 'inherited_resources', '~> 1.4'
gem "redcarpet"
gem 'puma'
gem 'airbrake'
gem 'sidekiq'
gem 'rakeflow'
gem 'strong_parameters'
gem 'foreman'


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
end

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'quiet_assets'
end
