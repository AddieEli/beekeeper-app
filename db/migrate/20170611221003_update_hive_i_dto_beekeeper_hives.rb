class UpdateHiveIDtoBeekeeperHives < ActiveRecord::Migration[5.1]
  def change
    add_column :beekeeper_hives, :hive_id, :integer
    add_column :beekeeper_hives, :beekeeper_id, :integer
    remove_column :beekeeper_hives, :beekeeper 
    remove_column :beekeeper_hives, :hive
      end
end
