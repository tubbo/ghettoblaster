User.create! \
  email: 'tom@thewonderbars.com',
  password: 'password',
  password_confirmation: 'password'

yaml = YAML::load_file("#{Rails.root}/config/settings.yml")
yaml.keys.each { |key,val| Setting.create(key: key, value: val) }
