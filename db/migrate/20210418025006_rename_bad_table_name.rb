class RenameBadTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :tag_foods, :appointment
  end
end
