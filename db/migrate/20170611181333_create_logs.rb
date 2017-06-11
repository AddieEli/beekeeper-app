class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.string :notes
      t.integer :hive_general_status
      t.integer :queen
      t.integer :larva
      t.integer :comb_build
      t.integer :weather_daily_low
      t.integer :weather_daily_high
      t.integer :weather_daily_average
      t.integer :hive_id

      t.timestamps
    end
  end
end
