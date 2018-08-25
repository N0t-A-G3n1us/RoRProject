class RemoveBossIdFromTeams < ActiveRecord::Migration[5.2]
  def change
    remove_column :teams, :boss_id, :integer
  end
end
