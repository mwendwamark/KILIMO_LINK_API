class ProductsController < ApplicationController
  # Allow public access or restrict to buyers as needed
  # before_action :authenticate_buyer!, only: [:index, :show] 

  def index
    @products = Product.all.order(created_at: :desc)
    render json: {
      success: true,
      products: @products.map { |product| product_json(product) }
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
