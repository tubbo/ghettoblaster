ActiveAdmin.register Subscriber do
  index do
    column :name
    column :email
    column("Signed up on") { |s| s.created_at.strftime '%m/%d/%Y' }
  end
end
