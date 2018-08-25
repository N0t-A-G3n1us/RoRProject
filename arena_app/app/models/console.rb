class Console < ApplicationRecord
    belongs_to :team, optional: true
    has_many :groups
    
    has_many :gamers_consoles
    has_many :gamers, through: :gamers_consoles

    has_many :platforms
    has_many :games, through: :platforms
end
