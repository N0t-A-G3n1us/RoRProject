class Challenge < ApplicationRecord
	belongs_to :team, inverse_of: :challenges
	belongs_to :challenging_team, class_name: 'Team', inverse_of: :challenges
end
