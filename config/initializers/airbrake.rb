if ENV['AIRBRAKE_API_KEY'].present? && defined? Airbrake
  Airbrake.configure do |config|
    config.api_key = ENV['AIRBRAKE_API_KEY']
  end
end
