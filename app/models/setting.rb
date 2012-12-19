class Setting < ActiveRecord::Base
  validates_presence_of :key
  validates_uniqueness_of :key
  attr_accessible :key, :value

  def self.for a_key
    setting = Setting.where(key: "#{a_key}").first

    if setting.present?
      setting.value
    else
      raise "Error: Setting not found."
    end
  end
end
