class AddColumnsToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :console_id, :integer
    add_column :teams, :game_id, :integer
  end
end
