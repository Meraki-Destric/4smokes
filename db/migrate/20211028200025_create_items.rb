class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.string :author
      t.integer :user_id

      t.timestamps
    end
  end
end
