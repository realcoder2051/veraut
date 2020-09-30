class AddUserIdToDocument < ActiveRecord::Migration[6.0]
	def change
		add_reference :documents, :user
  end
end
