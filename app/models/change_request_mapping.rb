class ChangeRequestMapping < ApplicationRecord
  belongs_to :contact_change_request ,dependent: :destroy
end
