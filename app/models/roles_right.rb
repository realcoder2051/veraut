class RolesRight < ApplicationRecord
  belongs_to :role
  attr_accessor :right_type,:name

end
