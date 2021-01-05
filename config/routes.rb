Rails.application.routes.draw do
  root 'application#welcome'
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
