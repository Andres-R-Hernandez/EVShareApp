class OwnedCarsController < ApplicationController

    def index
        @owned_cars = OwnedCar.all
    end
    
    def show
        @owned_car = OwnedCar.find(params[:id])
    end
    
    def new
        @owned_car = OwnedCar.new
    end
    
    def create
        @owned_car = OwnedCar.new(owned_car_params)
        if @owned_car.valid?
            @owned_car.save
            redirect_to @owned_car
        else
            render :new
        end
    end
    
    private
    
    def owned_car_params
        params.require(:owned_car).permit(:year, :price_per_day, :city, :car_model_id, :user_id)
    end
end
