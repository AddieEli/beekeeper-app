class CreateBeekeeperHives < ActiveRecord::Migration[5.1]
  def change
    create_table :beekeeper_hives do |t|
      t.integer :hive
      t.integer :beekeeper

      t.timestamps
    end
  end
end
