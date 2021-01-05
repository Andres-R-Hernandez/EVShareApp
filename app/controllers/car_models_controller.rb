class CarModelsController < ApplicationController
  def index
    @car_models = CarModel.all
  end
end
