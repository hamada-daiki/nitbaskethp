class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :title
      t.text :body
      t.string :img

      t.timestamps
    end
  end
end
