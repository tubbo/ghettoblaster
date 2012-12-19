require 'spec_helper'
require 'capybara/rspec'

feature "Home page includes promotional copy" do
  before { visit "/" }

  it "includes the title from settings" do
    page.should have_css '#title'
    find(:css, '#title').text.should == Settings.party_name
  end

  it "include the image from settings" do
    page.should have_css '#flyer'
    find(:css, '#flyer > img')[:src].should == Settings.flyer_url
  end
end
