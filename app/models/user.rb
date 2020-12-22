class User < ApplicationRecord

	resourcify

  belongs_to :role,optional:true
  belongs_to :client,optional:true
  belongs_to :bei_employee,optional:true

  devise :timeoutable, :timeout_in => 15.minutes
  attr_accessor :category_type
  validates_presence_of :category_type
  attr_accessor :user
  validates_presence_of :user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable, :timeoutable, :omniauthable

  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable
  #belongs_to :task_group,optional:true
  has_one :task_group,dependent: :destroy
  validates :role,:username, presence: true

  scope :ordered, -> { order(name: :asc) }

end
