class Addusergamestogames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :user_game, :string
  end
end
