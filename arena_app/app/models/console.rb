class Console < ApplicationRecord
    belongs_to :team, optional: true
    belongs_to :group, optional: true
    
    has_many :gamers_consoles
    has_many :gamers, through: :gamers_consoles

end
