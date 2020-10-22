class AddUserIdAndTaskIdInAddressMapping < ActiveRecord::Migration[6.0]
  def change
    add_column :address_mappings,:user_id, :integer
    add_column :address_mappings,:task_id, :integer
  end
end
