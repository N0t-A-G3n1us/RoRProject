class Ability
  include CanCan::Ability
  include SessionsHelper

  def initialize(gamer)

      # permissions for every user, even if not logged in
      # additional permissions for logged in users 
      

    can :read, :all
    cannot :read , InviteRequest
    cannot :read , Challenge
    can :my_groups, Group
    can [:destroy,:update,:edit], Gamer
    if gamer.nil? 
      can :create, Gamer 
    
    elsif gamer.admin?  # additional permissions for administrators
      can :manage, :all
    elsif gamer.casual?
      can :read, :all
      can :join, Group do |group|
        gamer.groups.nil?||!gamer.groups.include?(group)
      end
      can :leave, Group do |group|
        !gamer.groups.nil? && gamer.groups.include?(group)
      end
    elsif gamer.pro?
      #Group
      can :create, Group if gamer.groups.count < 1                    #can create just one group
      can [:update,:destroy], Group , creator_id: gamer.id  
      can :join, Group do |group|
        gamer.groups.nil?||!gamer.groups.include?(group)
      end
      can :leave, Group do |group|
        !gamer.groups.nil? && gamer.groups.include?(group)
      end
      #Team                                                           #can join/leave just one team
      can :join, Team do |team| 
        gamer.team.nil? || gamer.team!= team 
      end
      can :leave, Team do |team|
        !gamer.team.nil? && gamer.team==team && team.boss != gamer
      end
      #Chatroom
      can :create, ChatroomUser do |jointb|
        gamer.chatroom == jointb.chatroom
      end




    elsif gamer.leader?
      #Team
      can :read, InviteRequest
      can [:accept,:refuse], InviteRequest do |team|
        team.boss == gamer
      end
      can :create, Team
      can :read, Challenge
      can [:update,:destroy,:edit], Team do |team|
         team.boss==gamer
      end
      can :join, Team do |team|
        gamer.team.nil? || gamer.team!= team 
      end
      can :leave, Team do |team|
        !gamer.team.nil? && gamer.team==team && team.boss != gamer
      end
      can :show_invites, Team  do |team|
         team.boss==gamer
      end
      can :add_challenge, Team do |team|
        team.boss != gamer && !gamer.team.nil? && gamer.team != team && gamer.team.boss==gamer
      end
      #Group
      can :create, Group if gamer.groups.count < 2
      can [:update,:destroy], Group, creator_id: gamer.id 
      can :join, Group do |group|
        gamer.groups.nil?||!gamer.groups.include?(group)
      end
      can :leave, Group do |group|
        !gamer.groups.nil? && gamer.groups.include?(group)
      end
      
      can :create, ChatroomUser do |jointb|
        gamer.chatroom == jointb.chatroom
      end
      can [:create,:destroy], Chatroom do |ch|
        (!Chatroom.team.nil? && Chatroom.team.boss==gamer ) || (!Chatroom.group.nil? && Chatroom.group.boss==gamer ) 
      end
    end

  end
end

