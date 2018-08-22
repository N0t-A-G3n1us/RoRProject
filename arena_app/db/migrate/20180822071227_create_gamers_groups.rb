class CreateGamersGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :gamers_groups do |t|
      t.integer :gamer_id
      t.integer :group_id

      t.timestamps
    end
  end
end
