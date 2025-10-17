module Buyers
  class ProfilesController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_buyer
    before_action :set_profile, only: [:show, :update, :destroy]

    # GET /buyers/profile
    def show
      render json: {
        success: true,
        profile: profile_json(@profile),
      }, status: :ok
    end

    # POST /buyers/profile
    def create
      @profile = current_user.build_buyer_profile(profile_params)

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

    # PUT/PATCH /buyers/profile
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

    # DELETE /buyers/profile
    def destroy
      @profile = current_user.buyer_profile

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
      @profile = current_user.buyer_profile
      return if @profile

      # Auto-create profile if it doesn't exist
      @profile = current_user.create_buyer_profile
    rescue ActiveRecord::RecordInvalid => e
      render json: {
        success: false,
        error: "Failed to create profile: #{e.message}",
      }, status: :unprocessable_entity
    end

    def ensure_buyer
      unless current_user.buyer?
        render json: {
          success: false,
          error: "Access denied. Buyer role required.",
        }, status: :forbidden
      end
    end

    def profile_params
      params.require(:buyer_profile).permit(
        :location,
        :county,
        :country,
        :profile_picture
      )
    end

    def profile_json(profile)
      {
        id: profile.id,
        user_id: profile.user_id,
        profile_picture_url: profile.profile_picture.attached? ? url_for(profile.profile_picture) : nil,
        location: profile.location,
        county: profile.county,
        country: profile.country,
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
