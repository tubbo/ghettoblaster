class BlastMailer < ActionMailer::Base
  include MarkdownHelper

  def announcement for_blast
    @blast = for_blast
    subscribers = Subscriber.select([:email]).all.map(&:email)
    mail from: Setting.for(:default_from_address), \
           to: Setting.for(:default_to_address),
          bcc: subscribers,
      subject: @blast.subject,
         body: markdown(@blast.body)
  end
end
