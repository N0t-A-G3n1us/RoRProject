# Cucumber Usage Example:
# Feature: Visit career guide page in career.guru99.com
# Scenario: Visit career.guru99.com
# Given: I am on career.guru99.com
# When: I click on career guide menu
# Then: I should see career guide page

Feature: Casual Gamer can manually show own team
      As a CASUAL GAMER
      I want to HAVE A PROFILE
      such that I can SHOW MY GROUP

Scenario: I want to see my group
Given As a CASUAL GAMER
When I click my group
Then  I should be redirected to group page
