require 'spec_helper'

describe Setting do
  fixtures :settings

  it "can be retrieved programatically" do
    Setting.for(:party_name).should == "Come Correct"
  end
end
