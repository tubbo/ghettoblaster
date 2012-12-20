class CreateBlasts < ActiveRecord::Migration
  def change
    create_table :blasts do |t|
      t.string :subject
      t.text :body
      t.boolean :is_published, default: false
      t.boolean :is_sent, default: false

      t.timestamps
    end
  end
end
