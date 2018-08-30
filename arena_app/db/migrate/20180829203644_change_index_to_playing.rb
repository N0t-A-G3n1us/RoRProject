class ChangeIndexToPlaying < ActiveRecord::Migration[5.2]
  def up
  	#set unique to true
  	
  	remove_index :playings, [:game_id,:group_id]
  	add_index :playings,[:game_id,:group_id], unique: true
  end

  def down
  	#reset unique to false
  	remove_index :playings,[:game_id,:group_id]
  	 add_index :playings, [:game_id,:group_id]
  end
end
