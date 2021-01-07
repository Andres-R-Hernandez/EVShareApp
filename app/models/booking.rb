class Booking < ApplicationRecord
  has_one :review
  belongs_to :user
  belongs_to :owned_car

  validates :pickup_time, presence: true
  validates :dropoff_time, presence: true
  validates :owned_car_id, presence: true
  validates :user_id, presence: true

  validate :booking_an_owned_car?
  validate :valid_booking_pickup?
  validate :valid_booking_dropoff?

  def booking_an_owned_car?
    if self.owned_car.user_id == self.user_id
      errors.add(:owned_car_id, "You cant rent your own car")
    end
  end

  def valid_booking_pickup?
    if self.pickup_time <= DateTime.current
      errors.add(:pickup_time, "Please select a future pickup time")
    end
  end

  def valid_booking_dropoff?
    if self.dropoff_time <= (self.pickup_time + 1.day)
      errors.add(:dropoff_time, "Please select a dropoff time at least one day after pickup")
    end
  end

end
