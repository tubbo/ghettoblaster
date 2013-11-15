require 'spec_helper'

feature "A subscriber to the list" do
  fixtures :settings

  let(:status_setting) { settings :status_closed }

  before { visit '/' }

  it "can not view the new subscriber form", sauce: true, js: true do
    page.should have_css '#new_subscriber'
  end
end
