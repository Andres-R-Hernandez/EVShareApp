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

  def edit
    @car_model = CarModel.find(params[:id])
  end

  def update
    @car_model = CarModel.find(params[:id])
    @car_model.update(car_model_params)

    if @car_model.save
      redirect_to @car_model
    else
      render :edit
    end
  end

  def destroy
    CarModel.find(params[:id]).destroy
    redirect_to car_models_path
  end

  private

  def car_model_params
    params.require(:car_model).permit(:brand, :model, :description, :image_url, :category)
  end
end
