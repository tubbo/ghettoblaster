class Setting < ActiveRecord::Base
  validates_presence_of :key
  attr_accessible :key, :value
end
