class Principal < ApplicationRecord
  validates :name,:ownership,:title, presence: true
end
