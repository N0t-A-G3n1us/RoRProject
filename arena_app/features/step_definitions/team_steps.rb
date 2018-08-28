Given("As a CASUAL GAMER") do

   complete_log_in

    expect(current_gamer.role).to eq("casual")
    visit team_path(Team.first)
  # Write code here that turns the phrase above into concrete actions
end

When("I click JoinTeam") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should be displayed in team members") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I click LeaveTeam") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should not more be displayed in team members") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I click challenge this team") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I am not member of this team") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I am boss of an other team") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I see my challenge in challenge list") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I click matches") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I can  SEE MATCH HISTORY") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I click SEE CHALLENGES") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I want to see all challenges") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I click invites") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I want to SEE INVITES") do
  pending # Write code here that turns the phrase above into concrete actions
end
