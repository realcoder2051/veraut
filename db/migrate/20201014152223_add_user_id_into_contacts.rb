class AddUserIdIntoContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :user_id, :integer
  end
end
