class AddColumnToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :year, :integer
    add_column :games, :month, :integer
    add_column :games, :day, :integer
    add_column :games, :hour, :integer
    add_column :games, :mini, :integer
  end
end
