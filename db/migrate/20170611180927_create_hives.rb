class CreateHives < ActiveRecord::Migration[5.1]
  def change
    create_table :hives do |t|
      t.string :bee_breed
      t.integer :hive_style
      t.string :hive_address
      t.string :hive_city
      t.string :hive_state

      t.timestamps
    end
  end
end
