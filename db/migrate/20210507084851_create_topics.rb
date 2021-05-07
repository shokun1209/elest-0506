class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.integer :category, null: false
      t.string :images
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
