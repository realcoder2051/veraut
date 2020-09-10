class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.integer :ein
      t.date :date_purchased_or_sold
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.boolean :does_company_have_employees
      t.string :qualified_plan_sponsored
      t.string :entity_type

      t.timestamps
    end
  end
end
