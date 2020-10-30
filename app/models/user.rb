class User < ApplicationRecord

	resourcify
	has_many :companies
  has_many_attached :documents
  has_many :documents, dependent: :destroy
  belongs_to :role,optional:true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable, :timeoutable, :omniauthable
  rolify :before_add => :before_add_method
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable
  #belongs_to :task_group,optional:true
  has_one :task_group,dependent: :destroy
  validates :username, presence: true

  scope :ordered, -> { order(name: :asc) }

  attr_accessor :role_type
  #accepts_nested_attributes_for :task_group

  def before_add_method(role)
    # do something before it gets added
  end



end
