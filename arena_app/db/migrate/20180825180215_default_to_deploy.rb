class DefaultToDeploy < ActiveRecord::Migration[5.2]
  def change
  	change_column :gamers, :role, :integer, null: false, default:0
  end
end
