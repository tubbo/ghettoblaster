module BlastContentHelper
  def text_contents
    @blast.body + raw_signature
  end

  def html_contents
    (html_email_body + html_signature).html_safe
  end

  private
  def html_email_body
    markdown @blast.body
  end

  def html_signature
    markdown raw_signature
  end

  def raw_signature
    %{
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
