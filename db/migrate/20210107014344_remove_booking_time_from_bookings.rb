class RemoveBookingTimeFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :booking_time, :datetime
  end
end
