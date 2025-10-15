module Farmers
  class ProfilesController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_farmer
    before_action :set_profile, only: [:show, :update]

    # GET /farmers/profile
    def show
      render json: {
        success: true,
        profile: profile_json(@profile),
      }, status: :ok
    end

    # POST /farmers/profile
    def create
      @profile = current_user.build_farmer_profile(profile_params)

      if @profile.save
        render json: {
          success: true,
          message: "Profile created successfully",
          profile: profile_json(@profile),
        }, status: :created
      else
        render json: {
          success: false,
          errors: @profile.errors.full_messages,
        }, status: :unprocessable_entity
      end
    end

    # PUT/PATCH /farmers/profile
    def update
      if @profile.update(profile_params)
        render json: {
          success: true,
          message: "Profile updated successfully",
          profile: profile_json(@profile),
        }, status: :ok
      else
        render json: {
          success: false,
          errors: @profile.errors.full_messages,
        }, status: :unprocessable_entity
      end
    end

    # DELETE /farmers/profile
    def destroy
      @profile = current_user.farmer_profile

      if @profile&.destroy
        render json: {
          success: true,
          message: "Profile deleted successfully",
        }, status: :ok
      else
        render json: {
          success: false,
          error: "Profile not found or could not be deleted",
        }, status: :unprocessable_entity
      end
    end

    private

    def set_profile
      @profile = current_user.farmer_profile
      unless @profile
        # Auto-create profile if it doesn't exist
        @profile = current_user.create_farmer_profile
      end
    end

    def ensure_farmer
      unless current_user.farmer?
        render json: {
          success: false,
          error: "Access denied. Farmer role required.",
        }, status: :forbidden
      end
    end

    def profile_params
      params.require(:farmer_profile).permit(
        :avatar,
        :bio,
        :county,
        :country,
        :is_verified
      )
    end

    def profile_json(profile)
      {
        id: profile.id,
        user_id: profile.user_id,
        avatar: profile.avatar,
        bio: profile.bio,
        county: profile.county,
        country: profile.country,
        is_verified: profile.is_verified,
        created_at: profile.created_at,
        updated_at: profile.updated_at,
        user: {
          id: profile.user.id,
          first_name: profile.user.first_name,
          last_name: profile.user.last_name,
          email: profile.user.email,
          phone_number: profile.user.phone_number,
        },
      }
    end
  end
end
