class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :key, null: false
      t.string :value, default: ""

      t.timestamps
    end
  end
end
