class CreateCarModels < ActiveRecord::Migration[6.0]
  def change
    create_table :car_models do |t|
      t.string :brand
      t.string :model
      t.string :description
      t.string :image_url

      t.timestamps
    end
  end
end
