class AddMemberToGamersGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :gamers_groups, :role, :integer
  end
end
