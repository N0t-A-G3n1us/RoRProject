class AddColumnsToGamersGamesAndGamersConsoles < ActiveRecord::Migration[5.2]
  def change
  	add_column :gamers_games, :game_id, :integer
  	add_column :gamers_games, :gamer_id, :integer
  	add_column :gamers_consoles, :console_id, :integer
  	add_column :gamers_consoles, :gamer_id, :integer

  end
end
