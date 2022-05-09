class AddRoleMaskToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :roles_mask, :integer, default: 2
  end
end
