# Cucumber Usage Example:
# Feature: Visit career guide page in career.guru99.com
# Scenario: Visit career.guru99.com
# Given: I am on career.guru99.com
# When: I click on career guide menu
# Then: I should see career guide page

Feature: Casual Gamer can manually show own info
      As a CASUAL GAMER
      I want to HAVE A PROFILE
      such that I can SHOW MY INFO

Scenario: I want to see my info
Given As a CASUAL GAMER
When I click Profile
Then  I should be redirected to my info page
