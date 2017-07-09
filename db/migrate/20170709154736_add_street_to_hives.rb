class AddStreetToHives < ActiveRecord::Migration[5.1]
  def change
    add_column :hives, :street, :string
  end
end
