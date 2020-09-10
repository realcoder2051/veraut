class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :ein
      t.date :fiscal_year_end
      t.string :entity_type
      t.string :naic_code
      t.string :payroll_provider
      t.string :payroll_frequency

      t.timestamps
    end
  end
end
