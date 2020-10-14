class AddIsCompletedToDataCollection < ActiveRecord::Migration[6.0]
	def change
		add_column :addresses, :is_completed, :boolean, default: false
		add_column :contact_numbers, :is_completed, :boolean, default: false
		add_column :companies, :is_completed, :boolean, default: false
		add_column :families, :is_completed, :boolean, default: false
		add_column :businesses, :is_completed, :boolean, default: false
		add_column :principals, :is_completed, :boolean, default: false
		add_column :employees, :is_completed, :boolean, default: false
		add_column :contacts, :is_completed, :boolean, default: false

  end
end
