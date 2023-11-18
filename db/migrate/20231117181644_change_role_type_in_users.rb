class ChangeRoleTypeInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :role, :integer
  end
end
