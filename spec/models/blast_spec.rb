require 'spec_helper'

describe Blast do
  subject { Blast.new(subject: "Announcement", body: "Lorem Ipsum") }

  it "sends an email out when saved" do
    subject.is_published = true

    subject.save.should == true
    subject.should be_published
    subject.should be_sent
  end

  it "fails to send when already sent" do
    delay = 1.day.ago
    subject.sent_at = delay

    subject.save.should == true
    subject.should be_sent
    subject.sent_at.should == delay
  end

  it "fails to send when not published" do
    subject.save.should == true
    subject.should_not be_published
    subject.should_not be_sent
  end
end
