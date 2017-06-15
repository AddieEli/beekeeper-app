class AddHiveNameToHive < ActiveRecord::Migration[5.1]
  def change
    add_column :hives, :hive_name, :string
    
  end
end
