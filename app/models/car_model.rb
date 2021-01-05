class CarModel < ApplicationRecord
  has_many :wish_list_cars
  has_many :owned_cars
  has_many :users, through: :wish_list_cars
end
