class Setting < ActiveRecord::Base
  validates :key, presence: true, uniqueness: true

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
      logger.info "Fetched Setting :#{a_key} from DB overrides."
      setting.value
    when yaml_setting.present?
      logger.info "Fetched Setting :#{a_key} from defaults."
      yaml_setting
    else
      logger.error "Setting :#{a_key} could not be found."
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
