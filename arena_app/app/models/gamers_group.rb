class GamersGroup < ApplicationRecord
	belongs_to :gamer
	belongs_to :group
	#roles
	enum role: [:casual,:creator]

end
