Rails.application.routes.draw do
  # Devise default routes can be disabled for HTML; we expose custom JSON endpoints below
  devise_for :users, skip: [:sessions, :registrations, :passwords, :confirmations]

  devise_scope :user do
    # Buyers auth endpoints
    post   '/buyers/signup',  to: 'buyers/registrations#create'
    post   '/buyers/login',   to: 'buyers/sessions#create'
    delete '/buyers/logout',  to: 'buyers/sessions#destroy'
    post   '/buyers/password', to: 'buyers/passwords#create'   # forgot
    put    '/buyers/password', to: 'buyers/passwords#update'   # reset

    # Farmers auth endpoints
    post   '/farmers/signup',  to: 'farmers/registrations#create'
    post   '/farmers/login',   to: 'farmers/sessions#create'
    delete '/farmers/logout',  to: 'farmers/sessions#destroy'
    post   '/farmers/password', to: 'farmers/passwords#create' # forgot
    put    '/farmers/password', to: 'farmers/passwords#update' # reset

    # Devise confirmation for email verification
    get '/auth/confirmation', to: 'auth/confirmations#show', as: :user_confirmation
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
