class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.boolean :published
      t.text :description
      t.string :name
      t.text :image_url
      t.string :slug

      t.timestamps
    end
  end
end
