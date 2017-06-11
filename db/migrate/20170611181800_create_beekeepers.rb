class CreateBeekeepers < ActiveRecord::Migration[5.1]
  def change
    create_table :beekeepers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :status
      t.string :bio

      t.timestamps
    end
  end
end
