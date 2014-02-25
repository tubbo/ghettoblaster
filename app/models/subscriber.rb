class Subscriber < ActiveRecord::Base
  attr_accessible :email, :name
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validate :email_can_be_sent

  # Helper method for getting the right Subscriber from a POST to
  # /subscribers.
  def self.find_or_create_by_email_and_name params={}
    existing_subscribers = where params

    if existing_subscribers.any?
      subscriber = existing_subscribers.first
      subscriber.update_attributes params
      subscriber
    else
      Subscriber.new params
    end
  end

  # Tests if this Subscriber has signed up for the current guest list.
  def on_guest_list?
    on_guest_list || false
  end

  private
  def email_can_be_sent
    errors.add :email, "is not valid" unless email =~ /(.*)@(.*)\.(.*)/
  end

  def ensure_active_upon_first_submission
    self.is_active ||= true
  end
end
