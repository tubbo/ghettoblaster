require "spec_helper"

describe BlastMailer do
  include MarkdownHelper

  fixtures :subscribers, :settings, :blasts

  let(:dummy_address) { settings(:default_to).value }
  let(:the_band) { settings(:default_from).value }
  let(:subscriber) { subscribers :tubbo }
  let(:blast) { blasts :wonderland_announcement }
  let(:markdown_body) { markdown @blast.body }

  subject { BlastMailer.announcement(blast) }

  it "sends to the list of subscribers" do
    expect(subject.bcc).to include(subscriber.email)
  end

  it "masks 'To:' with a dummy address" do
    expect(subject.to).to include(dummy_address)
  end

  it "uses the band email as 'From:'" do
    expect(subject.from).to include(the_band)
  end

  it "uses the subject of the blast" do
    expect(subject.subject).to eq(blast.subject)
  end

  it "parses Markdown to form the body" do
    expect(subject.encoded).to match(/#{markdown_body}/)
  end
end
