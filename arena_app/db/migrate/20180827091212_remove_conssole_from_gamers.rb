class RemoveConssoleFromGamers < ActiveRecord::Migration[5.2]
  def change
    remove_column :gamers, :conssole, :string
  end
end
