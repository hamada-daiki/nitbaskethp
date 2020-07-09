class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :number
      t.string :from
      t.integer :height

      t.timestamps
    end
  end
end
