class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :parent, foreign_key: { to_table: :comments }, null: true  # Self-referential, nullable
      t.text :comment_body
      t.integer :comment_likes, default: 0

      t.timestamps
    end
  end
end