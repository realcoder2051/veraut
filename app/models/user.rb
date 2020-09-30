class User < ApplicationRecord
  rolify
  resourcify
  has_many_attached :documents
  has_many :documents, dependent: :destroy, inverse_of: :user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable, :timeoutable, :omniauthable
  rolify :before_add => :before_add_method
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable
  #belongs_to :task_group,optional:true
  has_one :task_group

  validates :username,:password, presence: true

  scope :ordered, -> { order(name: :asc) }

  attr_accessor :name
  #accepts_nested_attributes_for :task_group

  def before_add_method(role)
    # do something before it gets added
  end



end
