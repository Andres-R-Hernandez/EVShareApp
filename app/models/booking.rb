class Booking < ApplicationRecord
  has_one :review
  belongs_to :user
  belongs_to :owned_car

  validate :booking_an_owned_car?
  
  def booking_an_owned_car?
    if self.owned_car.user_id == self.user_id
      errors.add(:owned_car_id, "You cant rent your own car") 
    end 
  end 
end
