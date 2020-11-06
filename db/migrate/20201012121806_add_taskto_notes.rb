class AddTasktoNotes < ActiveRecord::Migration[6.0]
	def change
		#remove_reference :notes, :task
		add_reference :notes, :task
  end
end
