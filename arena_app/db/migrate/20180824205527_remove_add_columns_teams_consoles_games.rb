class RemoveAddColumnsTeamsConsolesGames < ActiveRecord::Migration[5.2]
  def change
  	remove_column :teams, :console_id,:integer
  	remove_column :teams, :game_id,:integer
  	add_column :games, :team_id,:integer
  	add_column :consoles, :team_id,:integer
  end
end
