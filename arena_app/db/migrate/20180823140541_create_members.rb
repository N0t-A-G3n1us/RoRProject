class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.integer :gamer_id
      t.integer :group_id

      t.timestamps
    end
  end
end
