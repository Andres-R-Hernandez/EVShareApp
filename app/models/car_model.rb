class CarModel < ApplicationRecord
  has_many :wish_list_cars
  has_many :owned_cars
  has_many :users, through: :wish_list_cars

  validates :brand, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
  validates :category, presence: true

  validates :model, presence: true
  validates :model, uniqueness: true

  def car_name
    "#{self.brand} #{self.model}"
  end

  def inventory
    if self.owned_cars
      self.owned_cars.count
    else
      #put button here to add to wish list
    end
  end

  def avg_rating
    owned_cars = self.owned_cars
    if owned_cars.any?
      bookings = owned_cars.filter_map{|owned_car|owned_car.bookings}.flatten
      if bookings.any?
        reviews = bookings.filter_map{|booking|booking.review}
        if reviews.any?
          ratings = reviews.filter_map{|review|review.star_rating}
          if ratings.any?
            (ratings.sum.to_f/ratings.count).round(1)
          else
            "N/A"
          end
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
