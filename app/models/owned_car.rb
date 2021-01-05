class OwnedCar < ApplicationRecord
  has_one :user
  has_one :car_model
  has_many :bookings
  has_many :users, through: :bookings
end
