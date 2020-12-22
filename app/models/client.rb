class Client < ApplicationRecord
  validates :client_name,:status,:email,presence: true
  validates :email,uniqueness: { case_sensitive: false }
  has_many :plans ,dependent: :destroy
  has_many :tasks,dependent: :destroy
  has_one :user,dependent: :destroy
end
