class AddActiveFieldInContactNumbers < ActiveRecord::Migration[6.0]
  def change
    add_column :contact_numbers,:active, :boolean, default: false
  end
end
