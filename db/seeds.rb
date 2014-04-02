require 'active_record/fixtures'

%w(settings).each do |table|
  ActiveRecord::Fixtures.create_fixtures "#{Rails.root}/spec/fixtures", table
end
