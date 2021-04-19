class CreateFoodFacts < ActiveRecord::Migration[5.2]
  def change
    create_table :food_facts do |t|
      t.references :facts, foreign_key: true
      t.references :foods, foreign_key: true

      t.timestamps
    end
  end
end
