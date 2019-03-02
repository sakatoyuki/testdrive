Rails.application.routes.draw do

  namespace :public do
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :users
    get "reservations/top", to: "reservations#top"
    get "reservations/confirm", to: "reservations#confirm"
    resources :reservations
  end

  namespace :admin do
    root to: "stocks#index"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :dealers do
      member do
        get "new_station"
        post "create_station"
        get "new_car"
        post "create_car"
      end
    end
    resources :stations
    resources :cars
    resources :stocks
  end
end
