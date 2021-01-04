class CreateOwnedCars < ActiveRecord::Migration[6.0]
  def change
    create_table :owned_cars do |t|
      t.integer :year
      t.integer :price_per_day
      t.string :city
      t.integer :car_model_id
      t.integer :user_id

      t.timestamps
    end
  end
end
