class Addfieldstousers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string
    # Ensures that no two people can have the exact same username
    add_index :users, :username, unique: true
  end
end
