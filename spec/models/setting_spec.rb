require 'spec_helper'

describe Setting do
  fixtures :settings

  %i(party_name nonexistant headline).each do |setting_name|
    let(setting_name) { Setting.for setting_name }
  end

  let(:setting_from_yaml) { Setting.from_yaml[:headline] }

  it "can be retrieved programatically" do
    expect(party_name).to eq('Come Correct')
  end

  it "returns a blank string when a setting can't be found" do
    expect(nonexistant).to be_blank
  end

  it "returns the yaml setting when the setting has no db value" do
    expect(headline).to eq(setting_from_yaml)
  end
end
