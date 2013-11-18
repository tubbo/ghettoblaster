require 'spec_helper'

feature "A subscriber to the list" do
  before { visit '/' }

  it "can view the new subscriber form",  js: true do
    page.should have_css '#new_subscriber'
  end

  it "submits the form with valid data",  js: true do
    fill_in :subscriber_name,  with: "Lester Tester"
    fill_in :subscriber_email, with: "lester@test.com"
    click_button "Add me to the guest list!"
  end

  it "will not submit without a name",  js: true do
    fill_in :subscriber_name,  with: ""
    fill_in :subscriber_email, with: "lester@test.com"
    click_button "Add me to the guest list!"

    page.should_not have_content '#thanks'
  end

  it "will not submit without an email",  js: true do
    fill_in :subscriber_name,  with: "Lester Tester"
    fill_in :subscriber_email, with: ""
    click_button "Add me to the guest list!"

    page.should_not have_content '#thanks'
  end

  it "will not submit without a valid email",  js: true do
    fill_in :subscriber_name,  with: "Lester Tester"
    fill_in :subscriber_email, with: "lester.tester"
    click_button "Add me to the guest list!"

    page.should_not have_content '#thanks'
  end
end
