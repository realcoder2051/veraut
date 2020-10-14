class ChangesInContactTable < ActiveRecord::Migration[6.0]
  def up
    remove_column :contacts,:rights
    remove_column :contacts,:name
    remove_column :contacts,:roles
    add_column :contacts,:role_id,:integer
  end

end
