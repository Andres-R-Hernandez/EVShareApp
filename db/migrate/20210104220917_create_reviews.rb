class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :booking_id
      t.integer :user_id
      t.text :description
      t.integer :star_rating

      t.timestamps
    end
  end
end
