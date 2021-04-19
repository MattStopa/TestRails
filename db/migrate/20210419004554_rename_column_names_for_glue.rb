class RenameColumnNamesForGlue < ActiveRecord::Migration[5.2]
  def change
    rename_column :food_facts, :facts_id, :fact_id
    rename_column :food_facts, :foods_id, :food_id

    rename_column :tag_glues, :foods_id, :food_id
    rename_column :tag_glues, :facts_id, :fact_id
    rename_column :tag_glues, :tags_id, :tag_id


  end
end
