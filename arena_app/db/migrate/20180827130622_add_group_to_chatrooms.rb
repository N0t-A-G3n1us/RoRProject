class AddGroupToChatrooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :chatrooms, :group, foreign_key: true
  end
end
