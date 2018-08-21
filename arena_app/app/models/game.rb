class Game < ApplicationRecord
  belongs_to :team
  has_many :playings
  has_many :groups , through: :playings
end
