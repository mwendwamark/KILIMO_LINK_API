module Buyers
  class SessionsController < Devise::SessionsController
    respond_to :json

    # POST /buyers/login
    def create
      normalize_login_param!
      user = find_user_for_login

      unless user
        return render json: { error: "Invalid login credentials" }, status: :unauthorized
      end

      unless user.buyer?
        return render json: { error: "Role mismatch. Use the correct portal for your role." }, status: :forbidden
      end

      unless user.confirmed?
        return render json: { error: "Email not confirmed. Please check your inbox." }, status: :forbidden
      end

      # Delegate to Devise to authenticate and sign in (devise-jwt will dispatch token)
      self.resource = warden.authenticate!(auth_options)
      sign_in(resource_name, resource)

      token = request.env["warden-jwt_auth.token"] || response.headers["Authorization"]&.split(" ")&.last
      render json: {
        message: "Login successful",
        user: user_json(resource),
        token: token,
      }, status: :ok
    end

    # DELETE /buyers/logout
    def destroy
      # Devise-jwt revocation configured via revocation_requests
      sign_out(resource_name)
      render json: { message: "Logout successful" }, status: :ok
    end

    private

    def normalize_login_param!
      return unless params[:user].is_a?(ActionController::Parameters)
      params[:user][:login] ||= params[:user][:email] || params[:user][:phone_number]
    end

    def find_user_for_login
      return nil unless params[:user]
      login = params[:user][:login]
      return nil if login.blank?
      User.where("lower(email) = ?", login.downcase).or(User.where(phone_number: login)).first
    end

    def user_json(user)
      {
        id: user.id,
        first_name: user.first_name,
        last_name: user.last_name,
        phone_number: user.phone_number,
        email: user.email,
        roles: Array(user.roles),
        created_at: user.created_at,
        updated_at: user.updated_at,
      }
    end
  end
end
