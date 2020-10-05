class Address < ApplicationRecord
	belongs_to :general ,optional:true
	validates :address1,:city,:state,:zip,:address_type, presence: true
end
