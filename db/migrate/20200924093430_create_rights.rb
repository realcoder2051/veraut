class CreateRights < ActiveRecord::Migration[6.0]
  def change
    create_table :rights do |t|
      t.string :right_type
      t.references :role
      t.references :roles_right

      t.timestamps
    end

    create_table(:roles_rights) do |t|
      t.references :role
   #   t.integer :role
      t.json:role_type
    end

  end
end
