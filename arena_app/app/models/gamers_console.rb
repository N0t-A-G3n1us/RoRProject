class GamersConsole < ApplicationRecord
	belongs_to :gamer
	belongs_to :console
	
end
