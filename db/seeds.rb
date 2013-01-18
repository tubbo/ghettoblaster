unless Setting.all.any?
  yaml = YAML::load_file("#{Rails.root}/config/settings.yml")
  yaml.keys.each do |key,val|
    if Setting.for(:"#{key}").blank?
      Setting.create(key: key, value: val)
    else
      Setting.where(key: key).first.update_attributes(value: val)
    end
  end
end
