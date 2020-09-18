class CreateNumbers < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_numbers do |t|
      t.string :number
      t.string :contact_type
      t.references :general

      t.timestamps
    end
  end
end
