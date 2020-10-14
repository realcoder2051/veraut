class Company < ApplicationRecord
	validates_length_of :ein, minimum: 3, maximum: 30
	validates :entity_type ,:fiscal_year_end, :payroll_frequency, presence: true
end
