# Boot the Rails environment
require File.expand_path('../boot', __FILE__)

# Load the parts of Rails that we need
require "rails"
%w(
  active_record
  action_controller
  action_mailer
  sprockets
).each do |framework|
  begin
    require "#{framework}/railtie"
  rescue LoadError
  end
end

# Load gem depedencies
Bundler.require :framework, :engines, :libraries, :assets, Rails.env

# Configure and start the application
module Ghettoblaster
  class Application < Rails::Application
    # Time Zone
    #config.time_zone = 'Central Time (US & Canada)'

    # i18n Locale
    #config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    #config.i18n.default_locale = :de

    # Use a local Redis server by default
    config.redis_url = "redis://localhost:6379"

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    # Configure the domain name with an env var, so we can use it in
    # emails.
    config.action_mailer.default_url_options = { host: ENV['DOMAIN_NAME'] }

    # Use the fullified version of Ember by default
    config.ember.variant = :development

    # Send mails to localhost by default
    config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  end
end
