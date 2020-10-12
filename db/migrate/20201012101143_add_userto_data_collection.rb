class AddUsertoDataCollection < ActiveRecord::Migration[6.0]
	def change
		add_reference :principals, :user
		add_reference :families, :user
		add_reference :businesses, :user
  end
end
