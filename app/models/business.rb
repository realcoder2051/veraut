class Business < ApplicationRecord
	validates :name,:ein,:qualified_plan_sponsored,:entity_type, presence: true

end
