# config/routes.rb
Rails.application.routes.draw do
  devise_for :users, skip: :all

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

    # Email confirmation
    get "/auth/confirmation", to: "auth/confirmations#show", as: :user_confirmation

    # Farmers resources
    scope module: :farmers do
      # Farms CRUD with nested Products
      resources :farms, only: %i[index show create update destroy], path: "farmers/farms" do
        # Products nested under farms
        resources :products, only: %i[index show create update destroy]
      end

      # Farmer Profile
      get "/farmers/profile", to: "profiles#show"
      post "/farmers/profile", to: "profiles#create"
      put "/farmers/profile", to: "profiles#update"
      patch "/farmers/profile", to: "profiles#update"
      delete "/farmers/profile", to: "profiles#destroy"
    end

    # Buyers resources
    scope module: :buyers do
      # Buyer Profile
      get "/buyers/profile", to: "profiles#show"
      post "/buyers/profile", to: "profiles#create"
      put "/buyers/profile", to: "profiles#update"
      patch "/buyers/profile", to: "profiles#update"
      delete "/buyers/profile", to: "profiles#destroy"
    end
    # Public Products (for buyers)
    resources :products, only: %i[index show]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
