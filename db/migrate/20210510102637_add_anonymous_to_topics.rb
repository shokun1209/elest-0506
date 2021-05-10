class AddAnonymousToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :anonymous, :boolean
    change_column :topics, :anonymous, :boolean, null: false
  end
end
