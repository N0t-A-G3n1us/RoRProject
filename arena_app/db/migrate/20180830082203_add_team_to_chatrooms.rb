class AddTeamToChatrooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :chatrooms, :team, foreign_key: true
  end
end
