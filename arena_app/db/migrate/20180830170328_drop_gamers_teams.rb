class DropGamersTeams < ActiveRecord::Migration[5.2]
  def change
  	drop_table :gamers_teams
  end
end
