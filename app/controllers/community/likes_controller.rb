module Community
  class LikesController < ApplicationController
    before_action :authenticate_user!

    # POST /community/posts/:post_id/like — toggle like
    def toggle
      post = Post.find(params[:post_id])
      existing_like = post.likes.find_by(user: current_user)

      if existing_like
        existing_like.destroy
        render json: {
          success: true,
          liked: false,
          likes_count: post.likes.count,
          message: "Post unliked"
        }
      else
        post.likes.create!(user: current_user)
        render json: {
          success: true,
          liked: true,
          likes_count: post.likes.count,
          message: "Post liked"
        }
      end
    rescue ActiveRecord::RecordNotFound
      render json: { success: false, error: "Post not found" }, status: :not_found
    end
  end
end
