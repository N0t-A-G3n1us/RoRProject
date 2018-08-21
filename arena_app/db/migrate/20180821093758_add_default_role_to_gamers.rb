class AddDefaultRoleToGamers < ActiveRecord::Migration[5.2]
  def change
	change_column_default :gamers, :role, 0
  end
end
