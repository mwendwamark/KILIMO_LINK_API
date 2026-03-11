class ProductsController < ApplicationController
  # Allow public access or restrict to buyers as needed
  # before_action :authenticate_buyer!, only: [:index, :show]

  # GET /products
  # Supports search, filtering, sorting, and pagination
  def index
    # Build cache key from query parameters
    cache_key = "products/index/#{cache_key_from_params}"
    
    # Cache the response for 15 minutes
    @result = Rails.cache.fetch(cache_key, expires_in: 15.minutes) do
      # Validate and sanitize parameters
      search_params = sanitize_search_params
      
      # Apply search and filters
      @products = Product.search_and_filter(search_params)
      
      # Paginate results
      page = (params[:page] || 1).to_i
      per_page = [(params[:per_page] || 20).to_i, 100].min # Max 100 per page
      
      @products = @products.page(page).per(per_page)
      
      # Build response
      {
        success: true,
        products: @products.map { |product| product_json(product) },
        meta: {
          current_page: @products.current_page,
          total_pages: @products.total_pages,
          total_count: @products.total_count,
          per_page: per_page,
          has_next_page: @products.next_page.present?,
          has_prev_page: @products.prev_page.present?
        }
      }
    end
    
    render json: @result
  end

  # GET /products/filter_options
  # Returns available filter options
  def filter_options
    options = Rails.cache.fetch("products/filter_options", expires_in: 1.hour) do
      Product.filter_options
    end
    
    render json: {
      success: true,
      filters: options
    }
  end

  def show
    @product = Product.find(params[:id])
    render json: {
      success: true,
      product: product_json(@product)
    }
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: "Product not found" }, status: :not_found
  end

  private

  # Sanitize and validate search parameters
  def sanitize_search_params
    {
      search: params[:search]&.strip,
      category: validate_category(params[:category]),
      min_price: params[:min_price],
      max_price: params[:max_price],
      county: params[:county]&.strip,
      sort: params[:sort] || "newest"
    }
  end

  # Validate category against allowed values
  def validate_category(category)
    return nil if category.blank?
    Product::CATEGORIES.include?(category) ? category : nil
  end

  # Generate cache key from search parameters
  def cache_key_from_params
    [
      params[:search],
      params[:category],
      params[:min_price],
      params[:max_price],
      params[:county],
      params[:sort],
      params[:page],
      params[:per_page]
    ].compact.join("/")
  end

  def product_json(product)
    {
      id: product.id,
      farm_id: product.farm_id,
      category: product.category,
      product_name: product.product_name,
      description: product.description,
      quantity: product.quantity,
      unit: product.unit,
      price_per_unit: product.price_per_unit,
      age: product.age,
      harvest_date: product.harvest_date,
      product_images: product.product_images.attached? ? product.product_images.map { |img| url_for(img) } : [],
      created_at: product.created_at,
      updated_at: product.updated_at,
      farm: {
        id: product.farm.id,
        user_id: product.farm.user_id,
        farm_name: product.farm.farm_name,
        county: product.farm.county,
      },
    }
  end
end
