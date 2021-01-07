class AddTimesToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :pickup_time, :datetime
    add_column :bookings, :dropoff_time, :datetime
  end
end
