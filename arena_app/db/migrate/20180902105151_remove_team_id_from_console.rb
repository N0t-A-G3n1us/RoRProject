class RemoveTeamIdFromConsole < ActiveRecord::Migration[5.2]
  def change
    remove_column :consoles, :team_id, :integer
  end
end
