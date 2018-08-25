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
        can :create, Group if gamer.groups.count < 4 
        can :update, Group , creator_id: gamer.id 
        can :destroy, Group,  creator_id: gamer.id 
      elsif gamer.leader?
        #can :read, :all
        can :create, Team if gamer.teams.count < 1
        can :update, Team, boss_id: gamer.id
        can :destroy, Team, boss_id: gamer.id
        can :create, Group 
        can :update, Group, creator_id: gamer.id 
        can :destroy, Group,  creator_id: gamer.id 

      end

    end
  end

