module ChallengesHelper
	def existing_match?(teamA,teamB)
		if teamA.matches.nil? || teamB.nil?
			return false
		elsif teamA.matches.include?(teamB) 
			return true
		else
			return false
		end
	end



end
