class ChangeColumnAtGroups < ActiveRecord::Migration[5.2]
  def change
  	rename_column :Group, :members_id, :member_id
  end
end
