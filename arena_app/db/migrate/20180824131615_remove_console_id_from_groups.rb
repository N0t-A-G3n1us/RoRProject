class RemoveConsoleIdFromGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :console_id, :integer
  end
end
