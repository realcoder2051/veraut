class AddActiveFieldInFamilyBusinessPrincipalEmployee < ActiveRecord::Migration[6.0]
  def change
    add_column :families,:active, :boolean, default: false
    add_column :businesses,:active, :boolean, default: false
    add_column :employees,:active, :boolean, default: false
    add_column :principals,:active, :boolean, default: false

  end
end
