class RemoveUniqueIndexFromGroups < ActiveRecord::Migration[5.2]
  def change
  	remove_index :gamers_groups, [:gamer_id, :group_id]
  end
end
