require 'spec_helper'

describe Setting do
  fixtures :settings

  it "can be retrieved programatically" do
    assert_equal "Come Correct", Setting.for(:party_name)
  end

  it "returns a blank string when a setting can't be found" do
    Setting.for(:does_not_exist_at_all).should == ""
  end
end
