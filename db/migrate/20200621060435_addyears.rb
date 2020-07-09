class Addyears < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :year, :integer
  end
end
