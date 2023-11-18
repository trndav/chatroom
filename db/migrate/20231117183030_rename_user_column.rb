class RenameUserColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :current_user
    add_column :users, :current_room, :integer
  end
end
