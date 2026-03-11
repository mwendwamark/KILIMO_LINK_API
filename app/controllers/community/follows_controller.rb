module Community
  class FollowsController < ApplicationController
    before_action :authenticate_user!

    # POST /community/users/:user_id/follow — toggle follow
    def toggle
      target_user = User.find(params[:user_id])

      if target_user.id == current_user.id
        return render json: { success: false, error: "You cannot follow yourself" }, status: :unprocessable_entity
      end

      existing_follow = current_user.active_follows.find_by(following_id: target_user.id)

      if existing_follow
        existing_follow.destroy
        render json: {
          success: true,
          following: false,
          followers_count: target_user.followers.count,
          message: "Unfollowed #{target_user.first_name}"
        }
      else
        current_user.active_follows.create!(following: target_user)
        render json: {
          success: true,
          following: true,
          followers_count: target_user.followers.count,
          message: "Now following #{target_user.first_name}"
        }
      end
    rescue ActiveRecord::RecordNotFound
      render json: { success: false, error: "User not found" }, status: :not_found
    end

    # GET /community/users/:user_id/followers
    def followers
      user = User.find(params[:user_id])
      render json: {
        success: true,
        followers: user.followers.map { |u| user_summary(u) },
        total: user.followers.count
      }
    end

    # GET /community/users/:user_id/following
    def following
      user = User.find(params[:user_id])
      render json: {
        success: true,
        following: user.following.map { |u| user_summary(u) },
        total: user.following.count
      }
    end

    private

    def user_summary(user)
      profile = user.farmer_profile || user.buyer_profile
      {
        id: user.id,
        first_name: user.first_name,
        last_name: user.last_name,
        roles: user.roles,
        is_following: current_user.following?(user),
        avatar_url: profile&.profile_picture&.attached? ? url_for(profile.profile_picture) : nil
      }
    end
  end
end
