class CreateWishListCars < ActiveRecord::Migration[6.0]
  def change
    create_table :wish_list_cars do |t|
      t.integer :car_model_id
      t.integer :user_id

      t.timestamps
    end
  end
end
