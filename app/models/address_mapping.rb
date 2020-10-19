class AddressMapping < ApplicationRecord
  belongs_to :address
  belongs_to :address_type
end
