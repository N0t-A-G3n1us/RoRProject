class Game < ApplicationRecord
  belongs_to :team, optional: true
  has_many :playings
  has_many :groups , through: :playings

  has_many :platforms
  has_many :consoles, through: :platforms

end
