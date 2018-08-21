class RemoveColumnToGamers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :gamers, :gammes
  end
end
