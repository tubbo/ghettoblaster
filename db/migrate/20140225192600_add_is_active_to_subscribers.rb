class AddIsActiveToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :is_active, :boolean
  end
end
