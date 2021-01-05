class OwnedCar < ApplicationRecord
  belongs_to :user
  belongs_to :car_model
  has_many :bookings
  has_many :users, through: :bookings
end
