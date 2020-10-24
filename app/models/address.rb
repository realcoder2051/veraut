class Address < ApplicationRecord
	belongs_to :general ,optional:true
	#validates :address1,:city,:state,:zip, presence: true
	has_many :address_mappings
end
