require 'spec_helper'
require 'capybara/rspec'

feature "A subscriber to the list", js: true do
  before { visit "/" }

  it "can view the new subscriber form" do
    page.save_screenshot 'index.png'

    page.should have_css '#new_subscriber'
  end

  it "submits the form with valid data" do
    fill_in :subscriber_name,  with: "Lester Tester"
    fill_in :subscriber_email, with: "lester@test.com"
    click_button "Add me to the guest list!"
    page.save_screenshot 'thanks.png'

    page.should have_css '#thanks'
  end

  it "will not submit without a name" do
    fill_in :subscriber_name,  with: "Lester Tester"
    fill_in :subscriber_email, with: "lester@test.com"
    click_button "Add me to the guest list!"
    page.save_screenshot 'error.png'

    page.should have_css '#error'
  end

  it "will not submit without an email" do
    fill_in :subscriber_name,  with: "Lester Tester"
    fill_in :subscriber_email, with: "lester@test.com"
    click_button "Add me to the guest list!"

    page.should have_css '#error'
  end

  it "will not submit without a valid email" do
    fill_in :subscriber_name,  with: "Lester Tester"
    fill_in :subscriber_email, with: "lester.tester"
    click_button "Add me to the guest list!"

    page.should have_css '#error'
  end
end
