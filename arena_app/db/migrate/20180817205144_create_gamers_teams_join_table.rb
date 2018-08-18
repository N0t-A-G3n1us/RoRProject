class CreateGamersTeamsJoinTable < ActiveRecord::Migration[5.2]
  
  def change
  # This is enough; you don't need to worry about order
  create_join_table :gamers, :teams

  # If you want to add an index for faster querying through this join:
  create_join_table :gamers, :teams do |t|
    t.index :category_id
    t.index :user_id
  
  end
end
