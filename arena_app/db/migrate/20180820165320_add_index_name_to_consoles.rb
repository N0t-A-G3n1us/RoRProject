class AddIndexNameToConsoles < ActiveRecord::Migration[5.2]
  def change
  	add_index :consoles,:name,unique: true
  end
end
