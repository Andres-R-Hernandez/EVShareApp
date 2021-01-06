class OwnedCar < ApplicationRecord
  belongs_to :user
  belongs_to :car_model
  has_many :bookings
  has_many :users, through: :bookings

  def car_full_name 
    year = self.year
    brand = self.car_model.brand
    model = self.car_model.model
     "#{year} #{brand} #{model}"   
  end

  def car_full_name_with_price
    price = self.price_per_day
    "#{car_full_name}, $#{price} per day" 
  end 

end
