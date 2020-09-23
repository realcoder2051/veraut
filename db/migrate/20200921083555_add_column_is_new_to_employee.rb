class AddColumnIsNewToEmployee < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :is_new, :boolean, default: true
  end
end
