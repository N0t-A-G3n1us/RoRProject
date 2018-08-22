class Group < ApplicationRecord
  validates :name, length: {minimum: 3,maximum: 10},
                         presence: true
  has_many :playings
  has_many :games , through: :playings

  has_many :gamers_groups
  has_many :members, through: :gamers_groups, source: :gamer

  has_one :console
end
