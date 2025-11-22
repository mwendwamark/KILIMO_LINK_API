# app/controllers/farmers/products_controller.rb
module Farmers
  class ProductsController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_farmer
    before_action :set_farm
    before_action :set_product, only: [:show, :update, :destroy]

    # GET /farmers/farms/:farm_id/products
    def index
      @products = @farm.products.order(created_at: :desc)

      render json: {
        success: true,
        products: @products.map { |product| product_json(product) },
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
          farm_name: product.farm.farm_name,
          county: product.farm.county,
        },
      }
    end
  end
end
