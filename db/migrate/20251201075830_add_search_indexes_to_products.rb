class AddSearchIndexesToProducts < ActiveRecord::Migration[8.0]
  def change
    # Add index on category for category filtering
    add_index :products, :category, name: 'index_products_on_category'
    
    # Add index on price_per_unit for price range queries
    add_index :products, :price_per_unit, name: 'index_products_on_price_per_unit'
    
    # Add index on farms.county for location filtering
    add_index :farms, :county, name: 'index_farms_on_county'
    
    # Add composite index for efficient pagination (created_at DESC, id DESC)
    add_index :products, [:created_at, :id], order: { created_at: :desc, id: :desc }, name: 'index_products_on_created_at_and_id'
    
    # Add GIN index for full-text search on product_name and description
    # Using PostgreSQL's built-in text search capabilities
    execute <<-SQL
      CREATE INDEX index_products_on_product_name_trgm ON products USING gin (product_name gin_trgm_ops);
      CREATE INDEX index_products_on_description_trgm ON products USING gin (description gin_trgm_ops);
    SQL
  end
  
  def down
    # Remove indexes in reverse order
    execute <<-SQL
      DROP INDEX IF EXISTS index_products_on_description_trgm;
      DROP INDEX IF EXISTS index_products_on_product_name_trgm;
    SQL
    
    remove_index :products, name: 'index_products_on_created_at_and_id'
    remove_index :farms, name: 'index_farms_on_county'
    remove_index :products, name: 'index_products_on_price_per_unit'
    remove_index :products, name: 'index_products_on_category'
  end
end
