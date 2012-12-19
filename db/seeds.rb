unless Setting.all.any?
  yaml = YAML::load_file("#{Rails.root}/config/settings.yml")
  yaml.keys.each { |key,val| Setting.create(key: key, value: val) }
end
