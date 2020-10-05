class Business < ApplicationRecord
	validates :name,:ein,:does_company_have_employees,:qualified_plan_sponsored,:entity_type, presence: true

end
