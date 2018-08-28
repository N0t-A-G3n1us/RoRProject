# Cucumber Usage Example:
# Feature: Visit career guide page in career.guru99.com
# Scenario: Visit career.guru99.com
# Given: I am on career.guru99.com
# When: I click on career guide menu
# Then: I should see career guide page


Feature: Have basic interaction with teams and groups from arena page

Scenario: I want to see group list
Given As a CASUAL GAMER 
When I click SearchGroup  
Then  I should be redirected to groups index page


Scenario: I want to see teams list
Given As a CASUAL GAMER   
When I click SearchTeam	
Then I should be redirected to teams index page

Scenario: I want to create a group
Given As a PRO GAMER   
When I click CreateGroup 
Then I should be redirected to group new form

Scenario: I want to create a team
Given As a LEADER   
When I click CreateTeam
Then I should be redirected to team new form

Scenario: I want to change gamer role to Leader
Given As a CASUAL GAMER  
When I click ChangeRole
Then I should get redirected to arena with changed role

Scenario: I want to change gamer role to Pro
Given As a CASUAL GAMER   
When I click ChangeRole 
Then I should get redirected to arena with changed role

