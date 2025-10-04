Rails.application.routes.draw do
  # Disable default Devise routes
  devise_for :users, skip: :all

  # Custom auth endpoints
  devise_scope :user do
    # Buyers
    post "/buyers/signup", to: "buyers/registrations#create"
    post "/buyers/login", to: "buyers/sessions#create"
    delete "/buyers/logout", to: "buyers/sessions#destroy"
    post "/buyers/password", to: "buyers/passwords#create"
    put "/buyers/password", to: "buyers/passwords#update"

    # Farmers
    post "/farmers/signup", to: "farmers/registrations#create"
    post "/farmers/login", to: "farmers/sessions#create"
    delete "/farmers/logout", to: "farmers/sessions#destroy"
    post "/farmers/password", to: "farmers/passwords#create"
    put "/farmers/password", to: "farmers/passwords#update"

    # Email confirmation - THIS IS THE KEY LINE
    get "/auth/confirmation", to: "auth/confirmations#show", as: :user_confirmation
  end

  get "up" => "rails/health#show", as: :rails_health_check
end