class AddtoPlalyer < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :img, :string
  end
end
