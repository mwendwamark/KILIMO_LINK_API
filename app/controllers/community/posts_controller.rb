module Community
  class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:show, :update, :destroy]

    # GET /community/posts
    def index
      feed_type = params[:feed]
      page = (params[:page] || 1).to_i
      per_page = [(params[:per_page] || 15).to_i, 50].min

      posts = if feed_type == "following"
        Post.feed_for(current_user)
      else
        Post.recent
      end

      posts = posts.includes(:user, :likes, :comments).page(page).per(per_page)

      render json: {
        success: true,
        posts: posts.map { |p| post_json(p) },
        meta: pagination_meta(posts)
      }
    end

    # GET /community/posts/:id
    def show
      render json: { success: true, post: post_json(@post, include_comments: true) }
    end

    # POST /community/posts
    def create
      post = current_user.posts.build(post_params)
      if post.save
        render json: { success: true, post: post_json(post), message: "Post created" }, status: :created
      else
        render json: { success: false, errors: post.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # PATCH /community/posts/:id
    def update
      unless @post.user_id == current_user.id
        return render json: { success: false, error: "Unauthorized" }, status: :forbidden
      end
      if @post.update(post_params)
        render json: { success: true, post: post_json(@post), message: "Post updated" }
      else
        render json: { success: false, errors: @post.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # DELETE /community/posts/:id
    def destroy
      unless @post.user_id == current_user.id
        return render json: { success: false, error: "Unauthorized" }, status: :forbidden
      end
      @post.destroy
      render json: { success: true, message: "Post deleted" }
    end

    private

    def set_post
      @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { success: false, error: "Post not found" }, status: :not_found
    end

    def post_params
      params.require(:post).permit(:content, post_images: [])
    end

    def post_json(post, include_comments: false)
      data = {
        id: post.id,
        content: post.content,
        views: post.views,
        likes_count: post.likes_count,
        comments_count: post.comments_count,
        liked_by_current_user: post.liked_by?(current_user),
        post_images: post.post_images.attached? ? post.post_images.map { |img| url_for(img) } : [],
        created_at: post.created_at,
        updated_at: post.updated_at,
        author: user_summary(post.user)
      }

      if include_comments
        top_comments = post.comments.top_level.recent.limit(20).includes(:user, replies: :user)
        data[:comments] = top_comments.map { |c| comment_json(c) }
      end

      data
    end

    def comment_json(comment)
      {
        id: comment.id,
        comment_body: comment.comment_body,
        comment_likes: comment.comment_likes,
        parent_id: comment.parent_id,
        created_at: comment.created_at,
        author: user_summary(comment.user),
        replies: comment.replies.recent.map { |r|
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
        has_next_page: collection.next_page.present?,
        has_prev_page: collection.prev_page.present?
      }
    end
  end
end
