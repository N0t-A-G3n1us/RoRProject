class Ability
  include CanCan::Ability
  include SessionsHelper

  def initialize(gamer)

      # permissions for every user, even if not logged in
      # additional permissions for logged in users


    can :read, :all
    cannot :read , InviteRequest
    cannot :read , Challenge
    cannot :read , Chatroom
    cannot :read , Match
    cannot :read , ChatroomUser
    cannot :read , Message

    if gamer.nil?
       can :create, Gamer
      # can [:destroy,:update,:edit], Gamer
    elsif gamer.admin?  # additional permissions for administrators
      can :manage, :all
    elsif gamer.casual?
      can [:destroy,:update,:edit], Gamer

      can :read, :all
      can :join, Group do |group|
        gamer.groups.nil?||!gamer.groups.include?(group)
      end
      can :leave, Group do |group|
        !gamer.groups.nil? && gamer.groups.include?(group)
      end
      can :my_groups , Group
       can :read, Chatroom do |ch|
          !ch.group.nil? && ch.group.members.include?(gamer) 
       end 
    elsif gamer.pro?
      can [:destroy,:update,:edit], Gamer

      #Group
      can :create, Group if gamer.groups.count < 1                    #can create just one group
      can [:update,:destroy], Group , creator_id: gamer.id
      can :join, Group do |group|
        gamer.groups.nil?||!gamer.groups.include?(group)
      end
      can :leave, Group do |group|
        !gamer.groups.nil? && gamer.groups.include?(group)
      end
      can :my_groups , Group
      #Team                                                           #can join/leave just one team

      can :read, Match do |m|
        !gamer.team.nil? && m.team==gamer.team 
      end


      can :send_invite, Team do |team|
        gamer.team.nil? || gamer.team!= team
      end


      can :leave, Team do |team|
        !gamer.team.nil? && gamer.team==team && team.boss != gamer
      end
      #Chatroom
      can :create, ChatroomUser do |jointb|
        gamer.chatroom == jointb.chatroom
      end
      ###
       can [:new,:create,:update,:destroy], Chatroom  do |ch|
          !ch.group.nil? && ch.group.creator==gamer 
       end

       can :read, Chatroom do |ch|
          (!ch.team.nil? && ch.team.gamers.include?(gamer) ) || (!ch.group.nil? && ch.group.members.include?(gamer) )
       end 

    elsif gamer.leader?

      can [:destroy,:update,:edit], Gamer

      #Team



      can [:update,:destroy,:edit], Team do |team|
         team.boss==gamer
      end

      can :create, Team  do |t| gamer.team.nil? end

      can :send_invite, Team do |team|
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

      #Challenge
      can :read, Challenge, team: { boss: gamer}
      can [:accept,:refuse], Challenge , team: { boss: gamer}


      #InviteRequest
      can :read, InviteRequest, team: { boss: gamer}
      can [:accept,:refuse], InviteRequest, team: {boss: gamer}

      #Match
      can :read, Match do |m|
        !gamer.team.nil? && m.team==gamer.team 
      end
      can [:accept,:refuse], Match, team: {boss: gamer}
      can [:edit,:update,:ragequit], Match, team: {boss: gamer}


      #Group
      can :create, Group if gamer.groups.count < 2
      can :my_groups , Group
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
      ###
       can [:new,:create,:update,:destroy], Chatroom  do |ch|
         (!ch.team.nil? && ch.team.boss==gamer ) || (!ch.group.nil? && ch.group.creator==gamer )
       end

       can :read, Chatroom do |ch|
          (!ch.team.nil? && ch.team.gamers.include?(gamer) ) || (!ch.group.nil? && ch.group.members.include?(gamer) )
       end 
    end

  end

end

