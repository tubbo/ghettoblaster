require 'spec_helper'
require 'capybara/rspec'

feature "Home page includes promotional copy" do
  before { visit "/" }

  let(:flyer_url) { Setting.for :flyer_url }
  let(:image_src) { find(:css, '#flyer > img')[:src] }

  it "include the image from settings", sauce: true, js: true do
    expect(page).to have_css('#flyer')
    expect(image_src).to match(flyer_url)
  end
end
