class RemoveAddressTypeColumnFromAddressTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses,:address_type
  end
end
