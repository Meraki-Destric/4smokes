class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title
      t.text :description
      t.integer :creator_id

      t.timestamps
    end
  end
end
