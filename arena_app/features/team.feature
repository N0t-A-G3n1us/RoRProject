Feature: I want to manage the team according to my role

Scenario: I want to join a team
Given As a CASUAL GAMER  
When I click JoinTeam 
Then I should be displayed in team members

Scenario: I want to leave a team
Given As a CASUAL GAMER  
When I click LeaveTeam 
Then I should not more be displayed in team members


Scenario: I want to send a challenge to the team showing 
Given As a LEADER 
When I click challenge this team
And I am not member of this team
And I am boss of an other team 
Then I see my challenge in challenge list

Scenario: I want to see all the matches of the team (disputed and not)
Given As a CASUAL GAMER 
When I click matches
Then I can  SEE MATCH HISTORY

Scenario: I want to see challenge proposals
Given As a LEADER   
When I click SEE CHALLENGES  	
Then I want to see all challenges


# 27. As a LEADER   I want to SEE CHALLENGES   	so that I can DENY CHALLENGE
# 28. As a LEADER   I want to SEE CHALLENGES    	so that I can EDIT RESULTS
# 29. As a LEADER   I want to SEE INVITES   	so that I can   ACCEPT INVITES
Scenario: I want to see invites to enter to this team
Given As a LEADER
When I click invites
Then I want to SEE INVITES 