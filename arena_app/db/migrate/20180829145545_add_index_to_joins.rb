class AddIndexToJoins < ActiveRecord::Migration[5.2]
  def change
  	add_index :gamers_consoles, [:gamer_id, :console_id], :unique => true
  	add_index :gamers_games, [:gamer_id, :game_id], :unique => true
  	add_index :gamers_groups, [:gamer_id, :group_id], :unique => true
  	add_index :invite_requests, [:gamer_id, :team_id], :unique => true
  end
end
