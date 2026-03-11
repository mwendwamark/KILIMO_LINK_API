module Community
  class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post

    # GET /community/posts/:post_id/comments
    def index
      comments = @post.comments.top_level.recent
                       .includes(:user, replies: :user)
                       .page(params[:page] || 1).per(20)
      render json: {
        success: true,
        comments: comments.map { |c| comment_json(c) },
        meta: pagination_meta(comments)
      }
    end

    # POST /community/posts/:post_id/comments
    def create
      comment = @post.comments.build(comment_params.merge(user: current_user))
      if comment.save
        render json: { success: true, comment: comment_json(comment), message: "Comment added" }, status: :created
      else
        render json: { success: false, errors: comment.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # DELETE /community/posts/:post_id/comments/:id
    def destroy
      comment = @post.comments.find(params[:id])
      unless comment.user_id == current_user.id
        return render json: { success: false, error: "Unauthorized" }, status: :forbidden
      end
      comment.destroy
      render json: { success: true, message: "Comment deleted" }
    end

    private

    def set_post
      @post = Post.find(params[:post_id])
    rescue ActiveRecord::RecordNotFound
      render json: { success: false, error: "Post not found" }, status: :not_found
    end

    def comment_params
      params.require(:comment).permit(:comment_body, :parent_id)
    end

    def comment_json(comment)
      {
        id: comment.id,
        comment_body: comment.comment_body,
        comment_likes: comment.comment_likes,
        parent_id: comment.parent_id,
        created_at: comment.created_at,
        author: user_summary(comment.user),
        replies: comment.replies.recent.includes(:user).map { |r|
          {
            id: r.id,
            comment_body: r.comment_body,
            comment_likes: r.comment_likes,
            parent_id: r.parent_id,
            created_at: r.created_at,
            author: user_summary(r.user)
          }
        }
      }
    end

    def user_summary(user)
      profile = user.farmer_profile || user.buyer_profile
      {
        id: user.id,
        first_name: user.first_name,
        last_name: user.last_name,
        roles: user.roles,
        avatar_url: profile&.profile_picture&.attached? ? url_for(profile.profile_picture) : nil
      }
    end

    def pagination_meta(collection)
      {
        current_page: collection.current_page,
        total_pages: collection.total_pages,
        total_count: collection.total_count,
        per_page: collection.limit_value,
        has_next_page: collection.next_page.present?
      }
    end
  end
end
