class CreateFarmerProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :farmer_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :avatar
      t.text :bio
      t.string :county
      t.string :country, default: "Kenya"
      t.boolean :is_verified

      t.timestamps
    end
  end
end
