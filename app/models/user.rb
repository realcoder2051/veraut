class User < ApplicationRecord
  rolify
  resourcify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable, :timeoutable, :omniauthable
  #belongs_to:role,optional:true
  rolify :before_add => :before_add_method
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  validates :username, presence: true

  scope :ordered, -> { order(name: :asc) }

  attr_accessor :name

  def before_add_method(role)
    # do something before it gets added
  end

end