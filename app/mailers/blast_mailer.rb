require 'resque_mailer'

# Mails out "blast" announcements to all subscribed email addresses.
# Enqueues mailings with Resque.

class BlastMailer < ActionMailer::Base
  include MarkdownHelper
  include Resque::Mailer

  attr_reader :blast

  # The email announcement blaster.
  def announcement for_blast
    @blast = for_blast
    mail with_parameters
  end

  # Parameters we're sending in the email.
  def with_parameters
    {
      from: default_from_address,
      to: default_to_address,
      bcc: all_subscribers,
      subject: @blast.subject,
      body: contents.html_safe
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

  def contents
    email_body + signature
  end

  def email_body
    markdown @blast.body
  end

  def signature
    markdown %{
    ------

    [Click here](#{unsubscribe_link}) to unsubscribe from this
    mailing.
    }
  end

  def unsubscribe_link
    "http://#{this_domain}/unsubscribe"
  end

  def this_domain
    Rails.application.config.action_mailer.default_url_options[:host]
  end
end
