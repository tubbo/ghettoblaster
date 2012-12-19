class Subscriber < ActiveRecord::Base
  attr_accessible :email, :name
  validates_presence_of :email, :name
  validates_uniqueness_of :email
  validate :email_can_be_sent

private
  def email_can_be_sent
    errors.add :email, "is not valid" unless email =~ /(.*)@(.*)\.(.*)/
  end
end
