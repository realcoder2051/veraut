class AddDefaultStatusEmployees < ActiveRecord::Migration[6.0]
  def change
    change_column :employees, :status, :integer, default: 0
  end
end
