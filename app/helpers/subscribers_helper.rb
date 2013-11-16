module SubscribersHelper
  def flyer_image_tag
    tag :img, src: flyer_url, alt: party_name
  end

  def headline_tag
    content_tag :h1, headline_text
  end

  private
  def headline_text
    return closed_headline if list_closed?
    open_headline
  end

  def closed_headline
    "#{party_name}: Sign-ups are currently closed."
  end

  def open_headline
    "#{party_name}: #{headline}"
  end
end
