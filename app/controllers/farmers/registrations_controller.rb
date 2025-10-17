# module Farmers
#   class RegistrationsController < Devise::RegistrationsController
#     respond_to :json

#     # POST /farmers/signup
#     def create
#       build_resource(sign_up_params.merge(roles: ["farmer"]))

#       if resource.save
#         render json: {
#           message: "Signup successful. Please confirm your email to activate your account.",
#           user: user_json(resource),
#         }, status: :created
#       else
#         render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
#       end
#     end

#     private

#     def sign_up_params
#       params.require(:user).permit(:first_name, :last_name, :phone_number, :email, :password)
#     end

#     def user_json(user)
#       {
#         id: user.id,
#         first_name: user.first_name,
#         last_name: user.last_name,
#         phone_number: user.phone_number,
#         email: user.email,
#         roles: Array(user.roles),
#         confirmed: user.confirmed?,
#         created_at: user.created_at,  # Add this line
#         updated_at: user.updated_at   # Add this line
#       }
#     end
#   end
# end

module Farmers
  class RegistrationsController < Devise::RegistrationsController
    include ActionController::MimeResponds
    respond_to :json

    # POST /farmers/signup
    def create
      build_resource(sign_up_params.merge(roles: ["farmer"]))

      if resource.save
        render json: {
          message: "Signup successful. Please confirm your email to activate your account.",
          user: user_json(resource)
        }, status: :created
      else
        render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :phone_number, :email, :password)
    end

    def user_json(user)
      {
        id: user.id,
        first_name: user.first_name,
        last_name: user.last_name,
        phone_number: user.phone_number,
        email: user.email,
        roles: Array(user.roles),
        confirmed: user.confirmed?,
        created_at: user.created_at,
        updated_at: user.updated_at,
      }
    end
  end
end
