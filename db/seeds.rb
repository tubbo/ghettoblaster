unless User.where(email: "tom@thewonderbars.com").any?
  User.create! \
    email: 'tom@thewonderbars.com',
    password: 'password',
    password_confirmation: 'password'
end

unless Setting.all.any?
  yaml = YAML::load_file("#{Rails.root}/config/settings.yml")
  yaml.keys.each { |key,val| Setting.create(key: key, value: val) }
end
