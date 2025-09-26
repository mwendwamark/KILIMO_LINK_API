# app/controllers/auth/confirmations_controller.rb
class Auth::ConfirmationsController < Devise::ConfirmationsController
  respond_to :json

  # GET /auth/confirmation?confirmation_token=...
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])

    if resource.errors.empty?
      render json: { message: 'Your email has been successfully confirmed.' }, status: :ok
    else
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
