class CreateGamersConsoles < ActiveRecord::Migration[5.2]
  def change
    create_table :gamers_consoles do |t|

      t.timestamps
    end
  end
end
