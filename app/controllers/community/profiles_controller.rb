module Community
  class ProfilesController < ApplicationController
    before_action :authenticate_user!

    # GET /community/users/:id
    def show
      user = User.find(params[:id])
      profile = user.farmer_profile || user.buyer_profile

      render json: {
        success: true,
        user: {
          id: user.id,
          first_name: user.first_name,
          last_name: user.last_name,
          roles: user.roles,
          avatar_url: profile&.profile_picture&.attached? ? url_for(profile.profile_picture) : nil,
          bio: profile.respond_to?(:bio) ? profile.bio : nil,
          county: profile&.county,
          is_verified: profile.respond_to?(:is_verified) ? profile.is_verified : nil,
          followers_count: user.followers.count,
          following_count: user.following.count,
          posts_count: user.posts.count,
          is_following: current_user.following?(user),
          is_current_user: current_user.id == user.id,
          joined_at: user.created_at
        },
        posts: user.posts.recent.limit(10).map { |p|
          {
            id: p.id,
            content: p.content,
            likes_count: p.likes_count,
            comments_count: p.comments_count,
            post_images: p.post_images.attached? ? p.post_images.map { |img| url_for(img) } : [],
            created_at: p.created_at
          }
        }
      }
    rescue ActiveRecord::RecordNotFound
      render json: { success: false, error: "User not found" }, status: :not_found
    end
  end
end
