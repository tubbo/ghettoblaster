# Set test mode
ENV["RAILS_ENV"] ||= 'test'

# Load test framework
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails'
require 'capybara/rspec'

# Re-enable when we have support files to deal with
#Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

# Configure Capybara for running feature specs
Capybara.default_driver = :sauce

# Configure RSpec for running...everything else
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # Run all examples within a DB transaction
  config.use_transactional_fixtures = true

  # Infer the base class of anonymous controllers automatically
  config.infer_base_class_for_anonymous_controllers = true

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
end
