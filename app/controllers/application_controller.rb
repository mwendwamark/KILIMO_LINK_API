class ApplicationController < ActionController::API
  respond_to :json

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { error: e.message }, status: :not_found
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number])
  end
end
