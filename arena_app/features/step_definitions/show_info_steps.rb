
 When("I click Profile") do
   # Write code here that turns the phrase above into concrete actions
   click_link("Profile")
 end

 Then("I should be redirected to my info page") do
   # Write code here that turns the phrase above into concrete actions

    current_path.should == gamer_path(current_gamer)

 end
