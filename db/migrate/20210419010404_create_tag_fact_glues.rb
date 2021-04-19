class CreateTagFactGlues < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_fact_glues do |t|
      t.references :fact, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
