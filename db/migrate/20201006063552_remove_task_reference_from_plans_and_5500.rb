class RemoveTaskReferenceFromPlansAnd5500 < ActiveRecord::Migration[6.0]
  def change
    remove_reference :fifty_five_hundreds, :task
    remove_reference :plans, :task
    drop_table :plans
    drop_table :fifty_five_hundreds
  end
end
