class CreateTagFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_foods do |t|
      t.string :name
      t.references :tag, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
