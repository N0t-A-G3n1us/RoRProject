class ChangeColumnToTeam < ActiveRecord::Migration[5.2]
  def change
  	remove_column :teams, :console
  	add_column :teams, :console_id, :integer
  end
end
