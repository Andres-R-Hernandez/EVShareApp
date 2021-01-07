class WishListCar < ApplicationRecord
  belongs_to :user
  belongs_to :car_model

  validates :user_id, presence: true
  validates :car_model_id, presence: true

  validate :already_exist?

  def already_exist?
    if WishListCar.find_by(user_id: self.user_id, car_model_id: self.car_model_id)
      errors.add(:car_model_id, "You have already requested this car")
    end
  end

end
