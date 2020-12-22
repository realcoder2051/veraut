class BeiEmployee < ApplicationRecord
  validates :first_name,:last_name,:email,:username,presence: true
  has_many :template_tasks,dependent: :destroy
  has_one :user,dependent: :destroy
end
