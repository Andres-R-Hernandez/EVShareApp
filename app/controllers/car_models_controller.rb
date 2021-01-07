class CarModelsController < ApplicationController
  def index
    @car_models = CarModel.all
  end

  def inventory
    @car_model = CarModel.find(params[:id])
    @inventory = OwnedCar.all.select do |owned_car|
    owned_car.car_model == @car_model
    end 
  end 

  def show
    @car_model = CarModel.find(params[:id])
  end

  def new
    return head(:forbidden) unless is_admin?
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
    return head(:forbidden) unless is_admin?
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
    return head(:forbidden) unless is_admin?
    CarModel.find(params[:id]).destroy
    redirect_to car_models_path
  end

  private

  def car_model_params
    params.require(:car_model).permit(:brand, :model, :description, :image_url, :category)
  end
end
