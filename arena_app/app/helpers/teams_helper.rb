module TeamsHelper

	def gamer_can_challenge?(team)
		if !current_gamer.team.nil? # cur gamer is in a team 
			@t=current_gamer.team
			if @t.boss == current_gamer && @t!=team #cur gamer is boss of a different team
				return true
			end
	#	flash[:danger]="You are not boss of any team"
		end

	#	flash[:danger]="You have no team"
		false
	end

end