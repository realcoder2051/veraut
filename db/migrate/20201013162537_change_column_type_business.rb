class ChangeColumnTypeBusiness < ActiveRecord::Migration[6.0]
	def up
    change_column :businesses, :does_company_have_employees, :string
  end

  def down
    change_column :businesses, :does_company_have_employees, :boolean
  end
end
