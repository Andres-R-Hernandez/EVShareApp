class Booking < ApplicationRecord
  belongs_to :review
  belongs_to :user
  belongs_to :owned_car
end
