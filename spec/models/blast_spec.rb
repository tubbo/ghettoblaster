require 'spec_helper'

describe Blast do
  subject do
    Blast.new \
      subject: "Announcement",
      body: "lorem ipsum",
      is_published: true
  end

  let(:past_date) { 1.day.ago.to_date }

  it "validates deliverability" do
    expect(subject).to be_valid
    expect(subject).to be_deliverable, "#{subject.errors.full_messages}"
  end

  it "instructs a background job to deliver its message" do
    expect(subject.deliver).to be_true
  end

  it "will not deliver when not valid" do
    subject.body = nil

    expect(subject).to_not be_valid
    expect(subject).to_not be_deliverable
  end

  it "will not deliver when already sent" do
    subject.sent_at = past_date

    expect(subject).to be_sent
    expect(subject).to_not be_deliverable, "#{subject.errors.full_messages}"
  end

  it "will not deliver when not published" do
    subject.is_published = false

    expect(subject).to_not be_published
    expect(subject).to_not be_deliverable, "#{subject.errors.full_messages}"
  end

  context "when already sent" do
    before { subject.sent_at = Time.now }

    xit "can't be deleted" do
      expect(subject.destroy).to be_a Blast
      expect(subject).to_not be_destroyed
      expect(subject.errors.full_messages).to include("can not be deleted if already sent")
    end
  end
end
