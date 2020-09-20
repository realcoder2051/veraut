class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable, :timeoutable, :omniauthable
  #belongs_to:role,optional:true
  rolify :before_add => :before_add_method
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  validates :name, presence: true

  scope :ordered, -> { order(name: :asc) }
  def before_add_method(role)
    # do something before it gets added
  end

end