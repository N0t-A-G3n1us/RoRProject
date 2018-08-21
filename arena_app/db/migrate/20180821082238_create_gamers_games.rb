class CreateGamersGames < ActiveRecord::Migration[5.2]
  def change
    create_table :gamers_games do |t|

      t.timestamps
    end
  end
end
