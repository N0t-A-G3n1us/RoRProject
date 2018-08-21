class RemoveDescritionFromConsoles < ActiveRecord::Migration[5.2]
  def change
  	remove_column :consoles,:descrition
  end
end
