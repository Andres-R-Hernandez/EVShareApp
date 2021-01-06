class WishListCarsController < ApplicationController

    def index
        @wish_list_cars = WishListCar.all
    end
    
    def show
        @wish_list_car = WishListCar.find(params[:id])
    end
    
    def new
        @wish_list_car = WishListCar.new
    end
    
    def create
        @wish_list_car = WishListCar.new(wish_list_cars_params)
        if @wish_list_car.valid?
            @wish_list_car.save
            redirect_to @wish_list_car
        else
            render :new
        end
    end
    
    private
    
    def wish_list_cars_params
        params.require(:wish_list_car).permit(:car_model_id, :user_id)
    end
    
end
