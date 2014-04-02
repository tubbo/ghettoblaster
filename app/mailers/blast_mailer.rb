require 'resque_mailer'

# Mails out "blast" announcements to all subscribed email addresses.
# Enqueues mailings with Resque.

class BlastMailer < ActionMailer::Base
  include MarkdownHelper, BlastContentHelper, Resque::Mailer

  attr_reader :blast

  # The email announcement blaster.
  def announcement for_blast
    @blast = for_blast
    mail(with_parameters) do |format|
      format.html { render html: html_contents }
      format.text { render text: text_contents }
    end
  end

  # Parameters we're sending in the email.
  def with_parameters
    {
      from: default_from_address,
      to: default_to_address,
      bcc: all_subscribers,
      subject: @blast.subject
    }
  end

  private
  def default_from_address
    Setting.for :default_from
  end

  def default_to_address
    Setting.for :default_to
  end

  def all_subscribers
    Subscriber.pluck [:email]
  end
end
