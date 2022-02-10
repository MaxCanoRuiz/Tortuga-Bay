Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :pirate_ships do
    resources :bookings
  end

  get "/dashboard", to: "pages#dashboard", as: "dashboard"
  get "/map", to: "pages#map", as: "map"
  post "/accept", to: "pages#accept", as: "accept_booking"
  post "/reject", to: "pages#reject", as: "reject_booking"
end
