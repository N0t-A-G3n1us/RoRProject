
Given("As a CASUAL GAMER") do

    complete_log_in

   expect(current_gamer.role).to eq("casual")
   visit arena_path
 end

 When("I click SearchGroup") do
   # Write code here that turns the phrase above into concrete actions
   click_link("SearchGroup")
 end

 Then("I should be redirected to groups index page") do
   # Write code here that turns the phrase above into concrete actions
   
   #Group.all.each do |g| puts g.inspect end
   
    current_path.should == "/groups"

 end

 When("I click SearchTeam") do
  # Write code here that turns the phrase above into concrete actions
  click_link("SearchTeam")
end

Then("I should be redirected to teams index page") do
   # Write code here that turns the phrase above into concrete actions
   current_path.should == "/teams"
 end

 Given("As a PRO GAMER") do
   # Write code here that turns the phrase above into concrete actions
   complete_log_in
    current_gamer.pro!
     #puts "------->" + current_gamer.nil?.inspect
   expect(current_gamer.role).to eq("pro")
   visit arena_path
end

When("I click CreateGroup") do
   click_link("CreateGroup") # Write code here that turns the phrase above into concrete actions
end

Then("I should be redirected to group new form") do
   current_path.should == "/groups/new" # Write code here that turns the phrase above into concrete actions
end

Given("As a LEADER") do
  
    complete_log_in
    current_gamer.leader!
   expect(current_gamer.role).to eq("leader")
   visit arena_path # Write code here that turns the phrase above into concrete actions
end

When("I click CreateTeam") do
  click_link("CreateTeam") # Write code here that turns the phrase above into concrete actions
end

Then("I should be redirected to team new form") do
  current_path.should == "/teams/new"# Write code here that turns the phrase above into concrete actions
end

When("I click ChangeRole") do
  click_link("ChangeRole")# Write code here that turns the phrase above into concrete actions
end

Then("I should get redirected to arena with changed role") do
   current_gamer.role.should_not == "leader"
   current_path.should == changerole_path # Write code here that turns the phrase above into concrete actions
end

