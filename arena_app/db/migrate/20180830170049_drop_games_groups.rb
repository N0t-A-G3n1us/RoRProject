class DropGamesGroups < ActiveRecord::Migration[5.2]
  def change
  	drop_table :games_groups
  end
end
