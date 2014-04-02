require File.expand_path('../boot', __FILE__)

require "rails"

%w(
  active_record
  action_controller
  action_view
  action_mailer
  sprockets
).each do |framework|
  begin
    require "#{framework}/railtie"
  rescue LoadError; end
end

Bundler.require \
  :framework, :engines, :libraries, *Rails.groups(:assets => %w(development test))

module Ghettoblaster
  class Application < Rails::Application
    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true

    # Use strong_parameters for mass assignment
    config.active_record.whitelist_attributes = false

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    # Configure the domain name with an env var, so we can use it in
    # emails.
    config.action_mailer.default_url_options = { host: ENV['DOMAIN_NAME'] }
  end
end
