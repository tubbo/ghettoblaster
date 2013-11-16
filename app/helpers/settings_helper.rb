module SettingsHelper
  def subscribe_button_text
    Setting.for :subscribe_button
  end

  def headline
    Setting.for :headline
  end

  def party_name
    Setting.for :party_name
  end

  def flyer_url
    Setting.for :flyer_url
  end

  def facebook_event_url
    Setting.for :facebook_event
  end

  def list_status
    Setting.for :status
  end

  def list_closed?
    list_status == 'closed'
  end
end
