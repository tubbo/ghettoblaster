class AddOnGuestListToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :on_guest_list, :boolean, default: true
  end
end
