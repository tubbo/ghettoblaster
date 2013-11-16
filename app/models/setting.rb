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
    yaml_setting = from_yaml[a_key]

    case true
    when setting.present? && !setting.value.blank?
      setting.value
    when yaml_setting.present?
      yaml_setting
    else
      logger.error "Error: Setting :#{a_key} was not found in the database."
      ""
    end
  end

  # A reader for loading settings from our local YAML file. Useful for
  # defaults.
  def self.from_yaml
    @yaml ||= YAML::load_file("#{Rails.root}/config/settings.yml").with_indifferent_access
  end

  # When this Setting is represented as a String, simply print the
  # name of its key. Used in the admin interface.
  def to_s
    self.key
  end
end
