class Ability
  include CanCan::Ability
  include SessionsHelper

  def initialize(gamer)

      # permissions for every user, even if not logged in
      # additional permissions for logged in users 
      

      can :read, :all
      if gamer.admin?  # additional permissions for administrators
        can :manage, :all
      elsif gamer.casual?
        can :read, :all
      elsif gamer.pro?
        #can :read, :all
        can :create, Group
        can :update, Group
        can :destroy, Group
      elsif gamer.leader?
        #can :read, :all
        can :create, Team
        can :update, Team
        can :destroy, Team
        can :create, Group
        can :update, Group


      end

    end
  end

