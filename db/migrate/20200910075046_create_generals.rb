class CreateGenerals < ActiveRecord::Migration[6.0]
  def change
    create_table :generals do |t|
      t.string :address_type
      t.string :address
      t.string :contact_type
      t.string :number

      t.timestamps
    end
  end
end
