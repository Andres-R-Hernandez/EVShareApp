class WishListCar < ApplicationRecord
  belongs_to :user
  belongs_to :car_model

end
