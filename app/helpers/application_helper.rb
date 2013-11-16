module ApplicationHelper
  def google_analytics_number
    Setting.for :google_analytics
  end

  def title_tag
    content_tag :title, title_text
  end

  def title_text
    "#{party_name} - #{headline}"
  end
end
