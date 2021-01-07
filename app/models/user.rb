class User < ApplicationRecord
  has_secure_password
  has_many :wish_list_cars
  has_many :bookings
  has_many :reviews
  has_many :owned_cars
  has_many :rentals, through: :bookings, source: :owned_car
  has_many :car_models, through: :wish_list_cars

  validates :name, presence: true
  # validates :password, presence: true
  # validates :password_digest, presence: true

  validates :email, presence: true
  validates :email, uniqueness: true

  validates :age, numericality: {greater_than: 0, allow_nil: true}

end
