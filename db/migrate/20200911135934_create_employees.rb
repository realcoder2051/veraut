class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.integer :ssn
      t.string :gender
      t.date :date_of_birth
      t.date :original_date_of_hire
      t.date :date_of_termination
      t.date :date_of_retire
      t.string :compensation
      t.integer :hours
      t.string :pre_tax_salary_deferal
      t.string :roth_salary_deferal
      t.string :employee_match
      t.string :company_division
      t.boolean :union_employee

      t.timestamps
    end
  end
end
