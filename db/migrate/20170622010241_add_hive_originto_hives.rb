class AddHiveOrigintoHives < ActiveRecord::Migration[5.1]
  def change
    add_column :hives, :hive_origin, :string
    add_column :hives, :queen_origin, :string
    remove_column :hives, :hive_address

  end
end
