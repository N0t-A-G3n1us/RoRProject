class Group < ApplicationRecord
  validates :name, length: {minimum: 3,maximum: 40},
                         presence: true

  validates :console, presence:true
  #validates :games,length:{minimum:1} #not working
  

  has_many :playings
  has_many :games , through: :playings

  has_many :gamers_groups
  has_many :members, through: :gamers_groups, source: :gamer


  belongs_to :creator,class_name: "Gamer"

  belongs_to :console

 
end
