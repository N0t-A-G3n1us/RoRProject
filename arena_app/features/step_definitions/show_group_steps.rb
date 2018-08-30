

 When("I click my group") do
   # Write code here that turns the phrase above into concrete actions
   click_link("Your Groups")
 end

 Then("I should be redirected to group page") do
   # Write code here that turns the phrase above into concrete actions

   #Group.all.each do |g| puts g.inspect end

    current_path.should == my_groups_path

 end
