require 'resque_mailer'

# Mails out "blast" announcements to all subscribed email addresses.
# Enqueues mailings with Resque.

class BlastMailer < ActionMailer::Base
  include MarkdownHelper, BlastContentHelper, Resque::Mailer

  attr_reader :blast

  # The email announcement blaster.
  def announcement for_blast
    @blast = for_blast
    mail with_parameters
    logger.info "Sent Blast '#{for_blast.id}' out to all subscribers"
  end

  # Parameters we're sending in the email.
  def with_parameters
    {
      from: default_from_address,
      to: default_to_address,
      bcc: all_subscribers,
      subject: @blast.subject,
      content_type: 'text/html',
      body: html_contents
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

  def html_contents
    (html_email_body + html_signature).html_safe
  end

  def html_email_body
    markdown @blast.body
  end

  def html_signature
    markdown raw_signature
  end

  def raw_signature
    %{
    ------

    [Click here](#{unsubscribe_url}) to unsubscribe from this
    mailing.
    }
  end
end
