class CreateResources < ActiveRecord::Migration[8.0]
  def change
    create_table :resources do |t|
      t.string :title
      t.text :content
      t.datetime :publish_date
      t.string :cover_image
      t.string :author
      t.string :source

      t.timestamps
    end
  end
end
