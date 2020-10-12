class AddUserToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_reference :companies, :user
  end
end
