# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #user ||= User.new # guest user (not logged in)

    # if user.has_role? :"Admin"
    #   can :manage, :all
    # else
    #   can :read, :all
    # end

    if user.username
      can :manage,:all
    end

    # if user.role.name=="Admin"
    #   can :manage,:all
    # elsif user.role.name=="Manager"
    #   can :manage, :Task,:User
    # end


    # if user.admin?  # additional permissions for administrators
    #   can :manage, User
    # end

    # user.roles.each do |role|
    #   if role == "Technician"
    #     can :read, :all
    #   else
    #     can :manage, :all
    #   end
    # end
    
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
