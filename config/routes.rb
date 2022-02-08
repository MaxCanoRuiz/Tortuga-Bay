Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :pirate_ships do
    resources :bookings
  end

  get "/dashboard", to: "pages#dashboard", as: "dashboard"
end
