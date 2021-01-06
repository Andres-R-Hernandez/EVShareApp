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

  def avg_rating
    bookings = self.bookings
    if bookings.any?
      reviews = bookings.filter_map{|booking|booking.review}
      if reviews.any?
        ratings = reviews.filter_map{|review|review.star_rating}
        if ratings.any?
          ratings.sum.to_f.round(2)/ratings.count
        else
          "N/A"
        end
      else
        "N/A"
      end
    else
      "N/A"
    end
  end
end
