unless ENV['AIRBRAKE_API_KEY'].nil?
  Airbrake.configure do |config|
    config.api_key = ENV['AIRBRAKE_API_KEY']
  end
end
