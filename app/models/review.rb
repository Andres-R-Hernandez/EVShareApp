class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking

  validates :booking_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  validates :star_rating, presence: true
end
