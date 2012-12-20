class AddSentAtToBlasts < ActiveRecord::Migration
  def change
    add_column :blasts, :sent_at, :datetime
  end
end
