Rails.application.routes.draw do

  namespace :public do
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :users
    get "reservations/top", to: "reservations#top"
    resources :reservations
  end

  namespace :admin do
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :dealers
    resources :stations
    resources :cars
    resources :stocks
  end
end
