

 When("I click my team") do
   # Write code here that turns the phrase above into concrete actions

   click_link("Your Team")
 end

 Then("I should be redirected to team page") do
   # Write code here that turns the phrase above into concrete actions


    current_path.should == team_path(current_gamer.team)

 end
