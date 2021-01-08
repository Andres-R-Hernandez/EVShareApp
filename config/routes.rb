Rails.application.routes.draw do
  root 'static#about'
  resources :bookings
  resources :wish_list_cars
  resources :reviews
  resources :owned_cars
  resources :car_models
  resources :users
  get "/static/about", to: "static#about", as: 'about'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/car_models/inventory/:id' => 'car_models#inventory', as: 'inventory'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
