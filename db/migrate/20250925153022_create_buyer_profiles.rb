class CreateBuyerProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :buyer_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :avatar
      t.string :location
      t.string :county
      t.string :country, default: "Kenya"

      t.timestamps
    end
  end
end
