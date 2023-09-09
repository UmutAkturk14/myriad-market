Rails.application.routes.draw do
  get 'offers/destroy'
  get 'users/show'
  get 'profiles/show'
  devise_for :users

  root to: "pages#landing", as: "landing"
  get 'home', to: 'pages#home', as: 'home'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Routes for activation/deactivation
  post "vehicles/:id/activate", to: "vehicles#activate", as: "activate_vehicle"
  post "services/:id/activate", to: "services#activate", as: "activate_service"

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:show, :update], path: 'profiles', as: 'user_profiles'

  resources :vehicles, only: [:show, :update, :destroy]
  resources :properties, only: [:show, :update, :destroy]
  resources :services, only: [:show, :update, :destroy]
  resources :offers, only: [:destroy, :update]
end
