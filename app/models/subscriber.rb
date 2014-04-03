
# A person with an email who signed up for the guest list at some point.

class Subscriber < ActiveRecord::Base
  attr_accessible :email, :name
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validate :email_can_be_sent

  # All subscribers going to the current party.
  scope :going, -> { where on_guest_list: true }

  # Helper method for getting the right Subscriber from a POST to
  # /subscribers.
  def self.subscribe params={}
    existing_subscribers = where email: params[:email]

    if existing_subscribers.any?
      subscriber = existing_subscribers.first
      subscriber.update_attributes on_guest_list: true
      subscriber
    else
      Subscriber.new params
    end
  end

  # Take all Subscribers that are going to the current party off the guest list.
  def refresh!
    going.update_attributes on_guest_list: false
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
