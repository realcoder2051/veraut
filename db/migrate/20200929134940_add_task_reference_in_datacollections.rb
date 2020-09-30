class AddTaskReferenceInDatacollections < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :task
    add_reference :businesses, :task
    add_reference :companies, :task
    add_reference :contact_numbers, :task
    add_reference :contacts, :task
    add_reference :employees, :task
    add_reference :families, :task
    add_reference :fifty_five_hundreds, :task
    add_reference :plans, :task
    add_reference :principals,:task
  end
end
