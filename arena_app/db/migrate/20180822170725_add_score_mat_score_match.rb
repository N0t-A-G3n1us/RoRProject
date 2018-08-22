class AddScoreMatScoreMatch < ActiveRecord::Migration[5.2]
  def change
  	add_column :matches, :score, :integer
  	add_column :matches, :mat_score, :integer
  	add_column :matches, :disputed, :boolean, default: false 
  	
  end
end
