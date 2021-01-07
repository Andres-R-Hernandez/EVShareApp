class AddCategoryToCarModels < ActiveRecord::Migration[6.0]
  def change
    add_column :car_models, :category, :string
  end
end
