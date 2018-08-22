class DropMemberTable < ActiveRecord::Migration[5.2]
	def change
		drop_table  :members  do  |t|

			t.integer :id, null:  false
			t.integer :gamer_id,  null:  false
			t.integer :team_id, null:  false
			t.timestamps null:  false

		end
	end
end
