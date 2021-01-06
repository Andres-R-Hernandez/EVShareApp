class CarModelsController < ApplicationController
  def index
    @car_models = CarModel.all
  end

  def show
    @car_model = CarModel.find(params[:id])
  end

  def new
    @car_model = CarModel.new
  end

  def create
    @car_model = CarModel.new(car_model_params)

    if @car_model.save
      redirect_to @car_model
    else
      render :new
    end
  end

  private

  def car_model_params
    params.require(:car_model).permit(:brand, :model, :description, :image_url)
  end
end
