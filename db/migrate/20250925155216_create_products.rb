class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.references :farm, null: false, foreign_key: true
      t.string :category
      t.string :product_name
      t.text :description
      t.integer :quantity
      t.string :unit
      t.decimal :price_per_unit
      t.integer :age
      t.date :harvest_date

      t.timestamps
    end
  end
end
