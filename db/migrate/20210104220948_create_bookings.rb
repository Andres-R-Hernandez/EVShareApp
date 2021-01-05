class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :owned_car_id
      t.integer :user_id
      t.datetime :booking_time

      t.timestamps
    end
  end
end
