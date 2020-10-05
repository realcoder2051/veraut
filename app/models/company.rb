class Company < ApplicationRecord
	validates :entity_type ,:fiscal_year_end, :payroll_frequency, presence: true

end
