class ContactNumber < ApplicationRecord
  belongs_to :general,optional:true
  attr_accessor :change_request_view
end
