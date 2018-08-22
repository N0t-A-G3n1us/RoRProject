class AddGamerTeams < ActiveRecord::Migration[5.2]
  def change
  	add_column :teams, :gamer_id, :integer

  	#contestual change
  	add_column :gamers, :group_id, :integer
  end
end
