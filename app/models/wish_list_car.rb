class WishListCar < ApplicationRecord
  belongs_to :user
  belongs_to :car_model

  validates :car_model_id, presence: true
  validates :user_id, presence: true
end
