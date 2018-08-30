# Cucumber Usage Example:
# Feature: Visit career guide page in career.guru99.com
# Scenario: Visit career.guru99.com
# Given: I am on career.guru99.com
# When: I click on career guide menu
# Then: I should see career guide page

Feature: Casual Gamer can manually show own team
      As a PRO GAMER
      I want to HAVE A PROFILE
      such that I can SHOW MY TEAM

Scenario: I want to see my team
Given As a PRO GAMER
When I click my team
Then  I should be redirected to team page
