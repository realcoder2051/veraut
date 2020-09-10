class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :company_name
      t.string :email
      t.string :roles
      t.string :rights

      t.timestamps
    end
  end
end
