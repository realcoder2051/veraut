class AddStepperInTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :steppers,:json
  end
end
