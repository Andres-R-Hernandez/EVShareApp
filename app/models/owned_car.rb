class OwnedCar < ApplicationRecord
  belongs_to :user
  belongs_to :car_model
  has_many :bookings
  has_many :users, through: :bookings

  validates :year, presence: true
  validates :year, numericality: {greater_than_or_equal_to: 1900}
  validates :year, numericality: {less_than_or_equal_to: Date.current.year}

  validates :price_per_day, presence: true
  validates :price_per_day, numericality: {greater_than_or_equal_to: 1}

  

  validates :city, presence: true
  validates :car_model_id, presence: true
  validates :user_id, presence: true

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
