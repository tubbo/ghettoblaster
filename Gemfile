source 'https://rubygems.org'
ruby '2.0.0'

group :framework do
  gem 'rails', '~> 3.2'
  gem 'pg'
  gem 'puma'
end

group :engines do
  gem 'zen_garden'
  gem 'inherited_resources', '~> 1.4'
  gem 'strong_parameters'
  gem 'haml-rails'
  gem 'activeadmin'
  gem 'redis-rails'
end

group :libraries do
  gem 'redcarpet'
  gem 'foreman'
  gem 'resque'
  gem 'resque_mailer'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'zurb-foundation', '~> 4.0'
end

group :development do
  gem "travis"
  gem 'meta_request'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara', '~> 2.0.3', :require => false
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
