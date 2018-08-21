class ChangeColumnToGamer < ActiveRecord::Migration[5.2]
  def change
  	remove_column :gamers, :description
  	add_column :gamers, :description, :text
  end
end
