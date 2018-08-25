class RemoveRoleFromGamersGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :gamers_groups, :role, :integer
  end
end
