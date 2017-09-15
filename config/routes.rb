Rails.application.routes.draw do
  # resources :appearances
  # resources :players
  get "/users/challenger/:id", to: "users#challenger", as: "challenger"
  resources :teams
  resources :games
  post "/teams/:id", to: "team#update"
  root "application#home"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/login", to: "sessions#destroy"
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users
end
