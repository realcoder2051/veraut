class Plan < ApplicationRecord
  validates :legal_plan_name,:plan_type,:effective_date_of_service,:plan_end,:admin_type,presence: true
  belongs_to :client
  has_many :projects,dependent: :destroy
end
