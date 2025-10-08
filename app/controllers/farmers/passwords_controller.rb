module Farmers
  class PasswordsController < Devise::PasswordsController
    include ActionController::RequestForgeryProtection
    protect_from_forgery with: :null_session, only: [:create, :update]
    respond_to :json

    # POST /farmers/password (forgot password)
    def create
      email = resource_params[:email]
      user = User.find_by(email: email)

      unless user
        return render json: { 
          success: false,
          error: "Email not found. Please check the email address and try again." 
        }, status: :not_found
      end

      unless user.farmer?
        return render json: { 
          success: false,
          error: "This email is not registered as a farmer. Please use the correct portal for your account type." 
        }, status: :forbidden
      end

      # Generate reset token and send email
      self.resource = resource_class.send_reset_password_instructions(resource_params)

      if successfully_sent?(resource)
        render json: { 
          success: true,
          message: "Password reset instructions have been sent to #{email}. Please check your email."
        }, status: :ok
      else
        render json: { 
          success: false,
          error: resource.errors.full_messages.join(". ") || "Unable to send password reset instructions. Please try again later."
        }, status: :unprocessable_entity
      end
    end

    # PUT /farmers/password (reset password with token)
    def update
      self.resource = resource_class.reset_password_by_token(update_params)
      
      if resource.errors.empty?
        render json: { 
          success: true,
          message: "Your password has been changed successfully. You can now log in with your new password."
        }, status: :ok
      else
        render json: { 
          success: false,
          errors: resource.errors.full_messages
        }, status: :unprocessable_entity
      end
    end

    private

    def resource_params
      params.require(:user).permit(:email)
    end

    def update_params
      params.require(:user).permit(
        :reset_password_token,
        :password,
        :password_confirmation
      )
    end
  end
end
