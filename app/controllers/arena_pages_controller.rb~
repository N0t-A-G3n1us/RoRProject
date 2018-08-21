class ArenaPagesController < ApplicationController
  def arena
  end

  def changerole
  end

  def upgrade
	if current_gamer.casual?
	  	current_gamer.pro!
	elsif current_gamer.pro?
		current_gamer.leader!
	elsif current_gamer.leader?
		current_gamer.admin!
	end

  end

	
  def downgrade
	if current_gamer.admin?
	  	current_gamer.leader!
	elsif current_gamer.pro?
		current_gamer.casual!
	elsif current_gamer.leader?
		current_gamer.pro!
	end

  end	
  

end
