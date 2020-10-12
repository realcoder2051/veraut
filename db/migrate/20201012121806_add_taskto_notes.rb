class AddTasktoNotes < ActiveRecord::Migration[6.0]
	def change
		add_reference :notes, :task
  end
end
