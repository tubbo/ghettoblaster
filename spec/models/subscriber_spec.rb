require 'spec_helper'

describe Subscriber do
  subject { Subscriber.new(email: "test@example.com", name: "Lester") }

  it "has a valid email address" do
    subject.email = "viagra-ad-or-something"

    subject.should_not be_valid
    subject.errors.full_messages.should include("Email is not valid")
  end
end
