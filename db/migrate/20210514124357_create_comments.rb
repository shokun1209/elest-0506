class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true
      t.integer :type_id, null: false
      t.text :comment,null: false
      t.boolean :anonymous, null: false
      t.string :images
      t.timestamps
    end
  end
end
