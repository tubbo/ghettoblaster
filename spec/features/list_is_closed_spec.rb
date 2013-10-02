require 'spec_helper'
require 'capybara/rspec'

feature "A subscriber to the list", js: !ENV['CI'] do
  fixtures :settings
  before do
    @status_setting = settings :status
    @status_setting.update_attributes(value: 'closed')
    visit "/"
  end

  it "can not view the new subscriber form" do
    page.should have_css '#new_subscriber'
  end

  after do
    @status_setting.update_attributes(value: 'open')
  end
end
