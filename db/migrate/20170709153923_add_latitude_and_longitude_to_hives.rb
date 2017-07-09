class AddLatitudeAndLongitudeToHives < ActiveRecord::Migration[5.1]
  def change
    add_column :hives, :latitude, :float
    add_column :hives, :longitude, :float
  end
end
