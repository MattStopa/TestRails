class AddNewTable < ActiveRecord::Migration[5.2]

    def change
      create_table :appointments do |t|
        t.string :name
        t.references :tag, foreign_key: true
        t.references :book, foreign_key: true
  
        t.timestamps
      end
    end
  
end
