class CreateTagGlues < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_glues do |t|
      t.references :facts, foreign_key: true
      t.references :foods, foreign_key: true
      t.references :tags, foreign_key: true

      t.timestamps
    end
  end
end
