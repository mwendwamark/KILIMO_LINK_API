# app/controllers/farmers/farms_controller.rb
module Farmers
  class FarmsController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_farmer
    before_action :set_farm, only: %i[show update destroy]  # Added show here

    # GET /farmers/farms
    def index
      render json: current_user.farms.order(created_at: :desc)
    end

    # GET /farmers/farms/:id - NEW ACTION
    def show
      render json: @farm
    end

    # POST /farmers/farms
    def create
      farm = current_user.farms.build(farm_params)
      if farm.save
        render json: farm, status: :created
      else
        render json: { errors: farm.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /farmers/farms/:id
    def update
      if @farm.update(farm_params)
        render json: @farm
      else
        render json: { errors: @farm.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # DELETE /farmers/farms/:id
    def destroy
      @farm.destroy
      head :no_content
    end

    private

    def set_farm
      @farm = current_user.farms.find(params[:id])
    end

    def farm_params
      params.require(:farm).permit(
        :farm_name, :county, :sub_county, :ward,
        :farm_latitude, :farm_longitude,
        :farm_description, :farm_type
      )
    end

    def ensure_farmer
      head :forbidden unless current_user.farmer?
    end
  end
end