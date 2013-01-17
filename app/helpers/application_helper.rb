module ApplicationHelper
  def google_analytics_number
    Setting.for :google_analytics
  end
end
