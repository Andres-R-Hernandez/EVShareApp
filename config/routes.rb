Rails.application.routes.draw do
  resources :bookings
  resources :wish_list_cars
  resources :reviews
  resources :owned_cars
  resources :car_models
  resources :users
  get "/static/about", to: "static#about", as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
