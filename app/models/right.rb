class Right < ApplicationRecord
  belongs_to :roles_right, dependent: :destroy,optional:true
  belongs_to :role, dependent: :destroy,optional:true

end
