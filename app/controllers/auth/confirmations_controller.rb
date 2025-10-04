class Auth::ConfirmationsController < Devise::ConfirmationsController

  # GET /auth/confirmation?confirmation_token=...
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])

    if resource.errors.empty?
      # Determine user type from roles
      user_type = resource.roles.include?("farmer") ? "farmer" : "buyer"

      # Redirect to frontend with success and user type
      redirect_to "#{frontend_url}/email-confirmed?confirmed=true&userType=#{user_type}", allow_other_host: true
    else
      # Redirect to frontend with error
      error_message = resource.errors.full_messages.join(", ")
      redirect_to "#{frontend_url}/email-confirmed?confirmed=false&error=#{CGI.escape(error_message)}", allow_other_host: true
    end
  end

  private

  def frontend_url
    if Rails.env.production?
      ENV["FRONTEND_URL"] || "https://kilimo-link.vercel.app"
    else
      ENV["FRONTEND_URL"] || "http://localhost:5173"
    end
  end
end
