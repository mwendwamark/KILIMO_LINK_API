class CreateFarms < ActiveRecord::Migration[8.0]
  def change
    create_table :farms do |t|
      t.references :user, null: false, foreign_key: true
      t.string :farm_name
      t.string :county
      t.string :sub_county
      t.string :ward
      t.float :farm_latitude
      t.float :farm_longitude
      t.text :farm_description
      t.string :farm_type

      t.timestamps
    end
  end
end
