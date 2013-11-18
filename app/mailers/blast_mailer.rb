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
      subject: blast.subject,
      body: body_in_markdown
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

  def body_in_markdown
    markdown @blast.body
  end
end
