class AddParentHiveIdToHives < ActiveRecord::Migration[5.1]
  def change
    add_column :hives, :parent_id, :integer
  end
end
