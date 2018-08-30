class Team < ApplicationRecord
  
  validates :name, length: {minimum: 3,maximum: 40},
  presence: true, uniqueness: true


  has_many :chatrooms

  has_one :boss, class_name: 'Gamer'
  has_many :gamers
  
  has_one :console
  has_one :game

  has_many :invite_requests , inverse_of: :team
  has_many :invites, through: :invite_requests, source: :gamer, dependent: :destroy
  
  has_many :matches
  has_many :matching_teams , through: :matches  
  
  has_many :challenges
  has_many :challenging_teams, through: :challenges,  dependent: :destroy 
  
  

  mount_uploader :avatar, TeamAvatarUploader
  validate  :avatar_size


  private 
      # Validates the size of an uploaded picture.
      def avatar_size
        if avatar.size > 3.megabytes
          errors.add(:avatar, "should be less than 3MB")
        end
      end


    end
