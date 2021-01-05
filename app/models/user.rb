class User < ApplicationRecord
  has_secure_password
  has_many :wish_list_cars
  has_many :bookings
  has_many :reviews
  has_many :owned_cars
  has_many :rentals, through: :bookings, source: :owned_car
  has_many :car_models, through: :wish_list_cars
end
