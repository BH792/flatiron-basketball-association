Rails.application.routes.draw do
  resources :users
  # resources :appearances
  # resources :players
  # resources :teams
  # resources :games
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
end
