class AddIsCompletedFieldInAddressMapping < ActiveRecord::Migration[6.0]
  def change
    add_column :address_mappings, :is_completed, :boolean, default: false
  end
end
