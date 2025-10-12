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
    
    # Farmers farms CRUD - Added show action
    scope module: :farmers do
      resources :farms, only: %i[index show create update destroy], path: "farmers/farms"
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end