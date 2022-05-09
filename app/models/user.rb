require 'rubygems'
require 'role_model'
class User < ApplicationRecord
  include RoleModel

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates_presence_of :first_name, :last_name
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  roles_attribute :roles_mask

  roles :admin, :external_user

  def self.roles_with_mask
    roles_mask = {}
    User.valid_roles.each do |role|
      roles_mask[role] = 2**User.valid_roles.index(role)
    end
    roles_mask
  end

  def admin?
    has_role?(:admin)
  end

  def external_user?
    has_role?(:external_user)
  end

end
