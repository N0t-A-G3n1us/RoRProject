class RchangeColumnToGroups < ActiveRecord::Migration[5.2]
  def change
  	remove_column :groups,:console
  	add_column :groups, :console_id, :integer
  end
end
