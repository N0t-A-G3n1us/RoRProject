module TeamsHelper

	def gamer_can_challenge?(team)
		if !current_gamer.team.nil? && !team.nil? # cur gamer is in a team 
			if @team.challenges.include? Challenge.find_by(challenging_team: current_gamer.team)
				#flash[:danger]="You have already sent a challenge request"
				return false
			end
			@t=current_gamer.team
			if @t.boss == current_gamer && @t!=team &&
				 team.game==@t.game && team.console==@t.console #cur gamer is boss of a different team and same games/consoles
				return true
			end
	#	flash[:danger]="You are not boss of any team"
		end

	#	flash[:danger]="You have no team"
		false
	end

end