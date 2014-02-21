class Subscriber < ActiveRecord::Base
  attr_accessible :email, :name
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validate :email_can_be_sent

private
  def email_can_be_sent
    errors.add :email, "is not valid" unless email =~ /(.*)@(.*)\.(.*)/
  end
end
