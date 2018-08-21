class AddGroupIdToConsole < ActiveRecord::Migration[5.2]
  def change
    add_column :consoles, :group_id, :integer
  end
end
