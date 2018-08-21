class ChangeColumnToConsoles < ActiveRecord::Migration[5.2]
  def change
  	remove_column :consoles, :description
  	add_column :consoles, :description, :text
  end
end
