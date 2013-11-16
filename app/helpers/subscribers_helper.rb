module SubscribersHelper
  def flyer_image_tag
    tag :img, src: flyer_url, alt: party_name
  end

  def headline_text
    return closed_headline if list_closed?
    headline
  end

  private
  def closed_headline
    "Sign-ups are currently closed."
  end
end
