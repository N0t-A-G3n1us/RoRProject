class Game < ApplicationRecord
  has_many :teams
  has_many :playings
  has_many :groups , through: :playings

  has_many :gamers_games
  has_many :gamers,through: :gamers_games, dependent: :destroy

  

end
