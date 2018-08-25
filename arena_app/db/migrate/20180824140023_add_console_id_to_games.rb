class AddConsoleIdToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :console_id, :integer
  end
end
