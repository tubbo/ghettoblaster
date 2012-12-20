class BlastMailer < ActionMailer::Base

  def announcement for_blast
    @blast = for_blast
    subscribers = Subscriber.select([:email]).all
    mail from: Setting.for(:default_from_address), \
           to: Setting.for(:default_to_address),
          bcc: subscribers,
      subject: @blast.subject
  end
end
