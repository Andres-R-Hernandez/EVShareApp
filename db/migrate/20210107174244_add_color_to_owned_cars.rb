class AddColorToOwnedCars < ActiveRecord::Migration[6.0]
  def change
    add_column :owned_cars, :color, :string
  end
end
