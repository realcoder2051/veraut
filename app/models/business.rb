class Business < ApplicationRecord
	validates :name,:qualified_plan_sponsored,:entity_type, :does_company_have_employees, presence: true
	validates :ein, length: {is: 9}
end
