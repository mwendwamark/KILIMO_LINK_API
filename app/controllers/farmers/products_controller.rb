# app/controllers/farmers/products_controller.rb
module Farmers
  class ProductsController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_farmer
    before_action :set_farm, except: [:all_farmer_products]
    before_action :set_product, only: [:show, :update, :destroy]

    # GET /farmers/farms/:farm_id/products
    def index
      @products = @farm.products.order(created_at: :desc)

      render json: {
        success: true,
        products: @products.map { |product| product_json(product) },
      }, status: :ok
    end

    # GET /farmers/products
    # Get all products across all farms owned by the farmer
    # Supports search, filtering, sorting, and pagination
    def all_farmer_products
      # Validate and sanitize parameters
      search_params = sanitize_search_params

      # Get farmer's farm IDs
      farm_ids = current_user.farms.pluck(:id)

      # Apply search and filters to farmer's products
      @products = Product.where(farm_id: farm_ids)
        .search_and_filter(search_params)

      # Paginate results
      page = (params[:page] || 1).to_i
      per_page = [(params[:per_page] || 20).to_i, 100].min

      @products = @products.page(page).per(per_page)

      render json: {
               success: true,
               products: @products.map { |product| product_json(product) },
               meta: {
                 current_page: @products.current_page,
                 total_pages: @products.total_pages,
                 total_count: @products.total_count,
                 per_page: per_page,
                 has_next_page: @products.next_page.present?,
                 has_prev_page: @products.prev_page.present?,
               },
             }, status: :ok
    end

    # GET /farmers/farms/:farm_id/products/:id
    def show
      render json: {
        success: true,
        product: product_json(@product),
      }, status: :ok
    end

    # POST /farmers/farms/:farm_id/products
    def create
      @product = @farm.products.build(product_params)

      if @product.save
        # Invalidate product caches
        invalidate_product_caches

        render json: {
                 success: true,
                 message: "Product created successfully",
                 product: product_json(@product),
               }, status: :created
      else
        render json: {
                 success: false,
                 errors: @product.errors.full_messages,
               }, status: :unprocessable_entity
      end
    end

    # PUT/PATCH /farmers/farms/:farm_id/products/:id
    def update
      if @product.update(product_params)
        # Invalidate product caches
        invalidate_product_caches

        render json: {
                 success: true,
                 message: "Product updated successfully",
                 product: product_json(@product),
               }, status: :ok
      else
        render json: {
                 success: false,
                 errors: @product.errors.full_messages,
               }, status: :unprocessable_entity
      end
    end

    # DELETE /farmers/farms/:farm_id/products/:id
    def destroy
      if @product.destroy
        # Invalidate product caches
        invalidate_product_caches

        render json: {
                 success: true,
                 message: "Product deleted successfully",
               }, status: :ok
      else
        render json: {
                 success: false,
                 error: "Product could not be deleted",
               }, status: :unprocessable_entity
      end
    end

    private

    def set_farm
      @farm = current_user.farms.find(params[:farm_id])
    rescue ActiveRecord::RecordNotFound
      render json: {
        success: false,
        error: "Farm not found",
      }, status: :not_found
    end

    def set_product
      @product = @farm.products.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: {
        success: false,
        error: "Product not found",
      }, status: :not_found
    end

    def ensure_farmer
      unless current_user.farmer?
        render json: {
          success: false,
          error: "Access denied. Farmer role required.",
        }, status: :forbidden
      end
    end

    def product_params
      params.require(:product).permit(
        :category,
        :product_name,
        :description,
        :quantity,
        :unit,
        :price_per_unit,
        :age,
        :harvest_date,
        product_images: [],
      )
    end

    # Sanitize and validate search parameters
    def sanitize_search_params
      {
        search: params[:search]&.strip,
        category: validate_category(params[:category]),
        min_price: params[:min_price],
        max_price: params[:max_price],
        county: params[:county]&.strip,
        sort: params[:sort] || "newest",
      }
    end

    # Validate category against allowed values
    def validate_category(category)
      return nil if category.blank?
      Product::CATEGORIES.include?(category) ? category : nil
    end

    # Invalidate product caches when products are modified
    def invalidate_product_caches
      Rails.cache.delete("products/filter_options")
    rescue StandardError
      # ignore cache errors in production
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
end
