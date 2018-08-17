class Match < ApplicationRecord
	belongs_to :team
	belongs_to :matching_team, class_name: 'Team'
end
