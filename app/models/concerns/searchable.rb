# app/models/concerns/searchable.rb
module Searchable
  extend ActiveSupport::Concern

  included do
    # Scope for full-text search on product_name and description
    scope :search_by_text, ->(query) {
      return all if query.blank?
      
      sanitized_query = sanitize_sql_like(query.strip)
      where(
        "product_name ILIKE :query OR description ILIKE :query",
        query: "%#{sanitized_query}%"
      )
    }

    # Scope for filtering by category
    scope :filter_by_category, ->(category) {
      return all if category.blank?
      where(category: category)
    }

    # Scope for filtering by price range
    scope :filter_by_price_range, ->(min_price, max_price) {
      scope = all
      scope = scope.where("price_per_unit >= ?", min_price.to_f) if min_price.present?
      scope = scope.where("price_per_unit <= ?", max_price.to_f) if max_price.present?
      scope
    }

    # Scope for filtering by county (through farm association)
    scope :filter_by_county, ->(county) {
      return all if county.blank?
      joins(:farm).where(farms: { county: county })
    }

    # Scope for sorting
    scope :sort_by_option, ->(sort_option) {
      case sort_option
      when "price_asc"
        order(price_per_unit: :asc)
      when "price_desc"
        order(price_per_unit: :desc)
      when "date_asc"
        order(created_at: :asc)
      when "date_desc", "newest"
        order(created_at: :desc)
      else
        order(created_at: :desc) # Default sort
      end
    }

    # Eager load farm data to prevent N+1 queries
    scope :with_farm_data, -> {
      includes(:farm)
    }
  end

  class_methods do
    # Combined search and filter method
    def search_and_filter(params)
      results = all
      results = results.search_by_text(params[:search]) if params[:search].present?
      results = results.filter_by_category(params[:category]) if params[:category].present?
      results = results.filter_by_price_range(params[:min_price], params[:max_price])
      results = results.filter_by_county(params[:county]) if params[:county].present?
      results = results.sort_by_option(params[:sort])
      results = results.with_farm_data
      results
    end

    # Get available filter options
    def filter_options
      {
        categories: Product::CATEGORIES,
        counties: Farm.distinct.pluck(:county).compact.sort,
        price_range: {
          min: Product.minimum(:price_per_unit) || 0,
          max: Product.maximum(:price_per_unit) || 0
        }
      }
    end
  end
end
