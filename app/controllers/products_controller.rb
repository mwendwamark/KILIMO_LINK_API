class ProductsController < ApplicationController
  # Allow public access or restrict to buyers as needed
  # before_action :authenticate_buyer!, only: [:index, :show] 

  def index
    @products = Product.all
    render json: @products
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
  end
end
