class User < ApplicationRecord
  has_secure_password
  has_many :wish_list_cars
  has_many :bookings
  has_many :reviews
  has_many :owned_cars
  has_many :rentals, through: :bookings, class_name: "OwnedCar"
  has_many :car_models, through: :wish_list_cars
end
