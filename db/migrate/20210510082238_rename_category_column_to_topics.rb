class RenameCategoryColumnToTopics < ActiveRecord::Migration[6.0]
  def change
    rename_column :topics, :category, :category_id
  end
end
