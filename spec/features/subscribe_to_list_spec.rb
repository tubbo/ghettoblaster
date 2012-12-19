require 'spec_helper'
require 'capybara/rspec'

feature "A subscriber to the list", js: true do
  before { visit "/" }

  it "can view the new subscriber form" do
    page.should have_css '#new_subscriber'
  end

  it "submits the form with valid data" do
    fill_in :name,  with: "Lester Tester"
    fill_in :email, with: "lester@test.com"
    click_button "Add me to the guest list!"

    page.should redirect_to '/thanks'
    page.should have_css '#thanks'
    page.should render_template 'pages/thanks'
  end

  it "will not submit without a name" do
    fill_in :name,  with: "Lester Tester"
    fill_in :email, with: "lester@test.com"
    click_button "Add me to the guest list!"

    page.should have_css '#error'
    page.should render_template 'application/error'
  end

  it "will not submit without an email" do
    fill_in :name,  with: "Lester Tester"
    fill_in :email, with: "lester@test.com"
    click_button "Add me to the guest list!"

    page.should have_css '#error'
    page.should render_template 'application/error'
  end

  it "will not submit without a valid email" do
    fill_in :name,  with: "Lester Tester"
    fill_in :email, with: "lester.tester"
    click_button "Add me to the guest list!"

    page.should have_css '#error'
    page.should render_template 'application/error'
  end
end
