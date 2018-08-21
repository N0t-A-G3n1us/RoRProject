class RenameColumnConsoleInTeam < ActiveRecord::Migration[5.2]
  def change
  	#in games non in team!!!!
  	remove_column :gamers, :conssole
  	remove_column :gamers, :gamme
  	add_column :gamers, :console_id, :integer
  	add_column :gamers, :game_id, :integer
  end
end
