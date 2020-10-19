class AddressMapping < ActiveRecord::Migration[6.0]
  def change
    create_table :address_mappings do |t|
      t.references :address
      t.references :address_type
      t.boolean :active
    end
  end
end
