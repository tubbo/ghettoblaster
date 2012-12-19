ActiveAdmin.register Setting do
  index do
    column :key
    column :value
    default_actions
  end

  show title: 'Settings Detail' do
    h3 setting.key
    attributes_table do
      row :value
      row :created_at
      row :updated_at
    end
  end
end
