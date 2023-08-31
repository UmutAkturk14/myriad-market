Rails.application.routes.draw do
  get 'users/show'
  get 'profiles/show'
  devise_for :users

  root to: "pages#landing", as: "landing"
  get 'home', to: 'pages#home', as: 'home'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:show, :edit, :update], path: 'profiles', as: 'user_profiles'

  resources :vehicles, only: [:show]
  resources :properties, only: [:show]
  resources :services, only: [:show]
end
