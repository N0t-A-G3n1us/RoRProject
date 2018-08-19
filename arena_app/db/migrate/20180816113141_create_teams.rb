class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :boss_id
      t.integer :invite_id
      t.integer :match_id
      t.integer :challenge_id
      t.integer :member_id

      t.timestamps
    end
  end
end
