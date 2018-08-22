module MatchesHelper
	def display_score(score)
		if score.nil?
			return ""
		elsif score < 0
			return "Retreat"
		else
			return score
		end
	end

	def display_no_score
		"[   |   ]"
	end
end
