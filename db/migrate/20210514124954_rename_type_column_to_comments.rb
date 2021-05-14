class RenameTypeColumnToComments < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :type, :type_id
  end
end
