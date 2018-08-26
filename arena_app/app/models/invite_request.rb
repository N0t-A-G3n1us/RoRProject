class InviteRequest < ApplicationRecord
	belongs_to :gamer, inverse_of: :invite_requests
    belongs_to :team, inverse_of: :invite_requests
end
