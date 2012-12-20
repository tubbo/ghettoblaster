require "spec_helper"

describe BlastMailer do
  fixtures :subscribers, :settings
  before do
    @the_band = settings(:default_from)
    @dummy_address = settings(:default_to)
    @subscriber = subscribers :tubbo
    @blast = Blast.new(subject: "Announcement", body: "test")
  end

  let(:email) { BlastMailer.announcement(@blast) }

  it "sends a mail bcc'd to subscribers and to a dummy address, with the blast body and subject" do
    email.bcc.should include(subscriber.email)
    email.to.should == [@dummy_address]
    email.subject.should == @blast.subject
    email.encoded.should =~ /#{@blast.body}/
    email.from.should == [@the_band]
  end
end
