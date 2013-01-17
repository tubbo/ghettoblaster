class Setting < ActiveRecord::Base
  validates_presence_of :key
  validates_uniqueness_of :key
  attr_accessible :key, :value

  # Retriever for the value of a Setting, with knowledge of its key.
  # Settings are only stored as Strings, no matter what, so if a Setting
  # can't be found in the DB a blank String is returned, and an error
  # is logged.
  #
  # Example:
  #   <%= Setting.for(:google_analytics) %>
  #
  def self.for a_key
    setting = Setting.where(key: "#{a_key}").first

    if setting.present?
      setting.value
    else
      logger.error "Error: Setting :#{a_key} was not found in the database."
      ""
    end
  end

  # When this Setting is represented as a String, simply print the
  # name of its key. Used in the admin interface.
  def to_s
    self.key
  end
end
