class AddRefToGameInGamer < ActiveRecord::Migration[5.2]
  def change
      add_reference :gamers, :team, foreign_key: true

  end
end
