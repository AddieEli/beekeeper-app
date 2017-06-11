class AddPasswordToBeekeepers < ActiveRecord::Migration[5.1]
  def change
    add_column :beekeepers, :password_digest, :string
  end
end
