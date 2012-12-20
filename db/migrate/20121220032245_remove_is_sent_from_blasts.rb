class RemoveIsSentFromBlasts < ActiveRecord::Migration
  def change
    remove_column :blasts, :is_sent
  end
end
