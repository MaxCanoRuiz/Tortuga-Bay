Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :pirate_ships do
    resources :bookings
  end

  get "/dashboard", to: "pages#dashboard", as: "dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
