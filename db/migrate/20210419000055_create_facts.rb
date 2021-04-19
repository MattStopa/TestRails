class CreateFacts < ActiveRecord::Migration[5.2]
  def change
    create_table :facts do |t|
      t.boolean :published
      t.text :links
      t.string :headline
      t.text :summary

      t.timestamps
    end
  end
end
