class CreateFamilies < ActiveRecord::Migration[6.0]
  def change
    create_table :families do |t|
      t.string :name
      t.string :relationship
      t.string :related_to

      t.timestamps
    end
  end
end
