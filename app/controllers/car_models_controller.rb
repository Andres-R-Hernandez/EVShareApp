class CarModelsController < ApplicationController
  def index
    @car_models = CarModels.all
  end
end
