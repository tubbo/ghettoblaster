ActiveAdmin.register Subscriber do
  index do
    column("Name") { |s| link_to s.name, admin_subscriber_path(s) }
    column("Signed up on") { |s| s.created_at.strftime '%m/%d/%Y' }
  end

  show do
    attributes_table do
      row :name
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
