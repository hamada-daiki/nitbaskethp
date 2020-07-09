class AddScheduleDate < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :year, :integer
    add_column :schedules, :month, :integer
    add_column :schedules, :day, :integer
    add_column :schedules, :hour, :integer
    add_column :schedules, :mini, :integer
  end
end
