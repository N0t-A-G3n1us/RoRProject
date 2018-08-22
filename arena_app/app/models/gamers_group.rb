class GamersGroup < ApplicationRecord
	belongs_to :gamer
	belongs_to :group
end
