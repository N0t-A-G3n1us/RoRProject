class Mistakes < ActiveRecord::Migration[5.2]
  def change
  	add_column :groups,:console_id,:integer
  	remove_column :consoles,:group_id,:integer
  end
end
