class Role < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => :users_roles
  attr_accessor :right_type
  has_many :roles_rights
  belongs_to :resource,
             :polymorphic => true,
             :optional => true


  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true
  has_one :role

  scopify
end
