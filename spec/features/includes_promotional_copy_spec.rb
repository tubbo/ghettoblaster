require 'spec_helper'
require 'capybara/rspec'

feature "Home page includes promotional copy" do
  before { visit "/" }

  it "include the image from settings", sauce: true, js: true do
    page.should have_css '#flyer'
    find(:css, '#flyer > img')[:src].should == Setting.for(:flyer_url)
  end
end
