class ChatroomUser < ApplicationRecord
  belongs_to :chatroom
  belongs_to :gamer
end
