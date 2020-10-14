class Company < ApplicationRecord
	validates :entity_type , :payroll_frequency, presence: true

end
