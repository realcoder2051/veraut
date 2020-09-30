class AddTaskreferenceInNotesAnd < ActiveRecord::Migration[6.0]
  def change
    remove_reference :documents, :user
    add_reference :notes, :task
    add_reference :documents,:task
  end
end
