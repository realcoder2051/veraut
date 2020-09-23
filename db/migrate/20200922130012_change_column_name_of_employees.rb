class ChangeColumnNameOfEmployees < ActiveRecord::Migration[6.0]
  def up
    add_column :employees, :status, :integer
  end

  def down
    remove_column :employees, :is_new, :boolean
  end
end
