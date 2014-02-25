class Subscriber < ActiveRecord::Base
  attr_accessible :email, :name
  before_validation :ensure_active_upon_first_submission
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :is_active, presence: true
  validate :email_can_be_sent

  private
  def email_can_be_sent
    errors.add :email, "is not valid" unless email =~ /(.*)@(.*)\.(.*)/
  end

  def ensure_active_upon_first_submission
    self.is_active ||= true
  end
end
