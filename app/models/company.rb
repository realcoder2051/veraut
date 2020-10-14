class Company < ApplicationRecord
	validates :entity_type ,:fiscal_year_end, :payroll_frequency, presence: true
	validates_length_of :ein, :maximum => 9

end
