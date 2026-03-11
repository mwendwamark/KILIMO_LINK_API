# ============================================================
# app/controllers/reviews_controller.rb
# Routes: /products/:product_id/reviews
# Both farmers and buyers can review any product except their own
# ============================================================

class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_product

  # GET /products/:product_id/reviews
  def index
    @reviews = @product.reviews
                        .includes(:user)
                        .order(created_at: :desc)

    render json: {
      success: true,
      reviews: @reviews.map { |r| review_json(r) },
      meta: {
        total: @reviews.count,
        average_rating: @reviews.any? ? (@reviews.sum(:rating).to_f / @reviews.count).round(1) : nil
      }
    }
  end

  # POST /products/:product_id/reviews
  def create
    # Prevent reviewing own product (farmers only)
    if current_user.farmer? && @product.farm.user_id == current_user.id
      return render json: {
        success: false,
        error: "You cannot review your own product."
      }, status: :forbidden
    end

    # Prevent duplicate review
    existing = @product.reviews.find_by(user: current_user)
    if existing
      return render json: {
        success: false,
        error: "You have already reviewed this product."
      }, status: :unprocessable_entity
    end

    @review = @product.reviews.build(review_params.merge(user: current_user))

    if @review.save
      render json: {
        success: true,
        message: "Review submitted successfully.",
        review: review_json(@review)
      }, status: :created
    else
      render json: {
        success: false,
        errors: @review.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  # DELETE /products/:product_id/reviews/:id
  def destroy
    @review = @product.reviews.find_by(id: params[:id], user: current_user)

    unless @review
      return render json: {
        success: false,
        error: "Review not found or unauthorized."
      }, status: :not_found
    end

    @review.destroy
    render json: { success: true, message: "Review deleted." }
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: "Product not found." }, status: :not_found
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def review_json(review)
    user = review.user
    profile = user.farmer_profile || user.buyer_profile

    {
      id: review.id,
      rating: review.rating,
      comment: review.comment,
      created_at: review.created_at,
      user: {
        id: user.id,
        first_name: user.first_name,
        last_name: user.last_name,
        roles: user.roles,
        avatar_url: profile&.profile_picture&.attached? ? url_for(profile.profile_picture) : nil
      }
    }
  end
end


# ============================================================
# ADD TO config/routes.rb
# ============================================================

# Inside your existing routes.rb, add this nested resource:
#
# resources :products, only: [:index, :show] do
#   resources :reviews, only: [:index, :create, :destroy]
# end
#
# Or if you already have `resources :products`, just add:
#
# resources :products do
#   resources :reviews, only: [:index, :create, :destroy]
# end


# ============================================================
# UPDATE app/models/review.rb
# ============================================================

# class Review < ApplicationRecord
#   belongs_to :user
#   belongs_to :product
#
#   validates :rating, inclusion: { in: 1..5 }, presence: true
#   validates :user_id, uniqueness: {
#     scope: :product_id,
#     message: "You have already reviewed this product"
#   }
# end