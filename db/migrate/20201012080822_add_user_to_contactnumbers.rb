class AddUserToContactnumbers < ActiveRecord::Migration[6.0]
  def change
    add_reference :contact_numbers, :user
  end
end
