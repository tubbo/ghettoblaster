require 'spec_helper'
require 'capybara/rspec'

feature "Home page includes promotional copy" do
  before { visit "/" }

  it "include the image from settings" do
    page.should have_css '#flyer'
    find(:css, '#flyer > img')[:src].should == Settings.flyer_url
  end
end
