class CreatePlatforms < ActiveRecord::Migration[5.2]
  def change
    create_table :platforms do |t|
      t.integer :game_id
      t.integer :console_id

      t.timestamps
    end
  end
end
