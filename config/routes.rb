Rails.application.routes.draw do
  get 'messages/create'
  get 'chat/show'
  get 'offers/destroy'
  get 'users/show'
  get 'profiles/show'
  devise_for :users

  root to: "pages#landing", as: "landing"
  get 'home', to: 'pages#home', as: 'home'
  get 'vehicles', to: 'pages#vehicles', as: 'vehicles'
  get 'properties', to: 'pages#properties', as: 'properties'
  get 'services', to: 'pages#services', as: 'services'
  post 'chats/:id', to: 'chats#unsubscribe', as: 'unsubscribe_chat'
  get "fetch_form", to: 'offers#fetch_form', as: :fetch_form


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Search
  get 'search', to: 'pages#search', as: 'search'

  # Routes for activation/deactivation
  post "vehicles/:id/activate", to: "vehicles#activate", as: "activate_vehicle"
  post "services/:id/activate", to: "services#activate", as: "activate_service"
  post "properties/:id/activate", to: "properties#activate", as: "activate_property"
  post "/hello", to: "pages#hello", as: :hello

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:show, :update], path: 'profiles', as: 'user_profiles'

  resources :vehicles, only: [:show, :update, :destroy, :create]
  resources :properties, only: [:show, :update, :destroy, :create]
  resources :services, only: [:show, :update, :destroy, :create]
  resources :offers, only: [:destroy, :update, :new, :create]
  resources :chats, only: [:show, :index]
  resources :messages, only: [:create]
end
