class WishListCarsController < ApplicationController

    def index
        @wish_list_cars = WishListCar.all
    end
    
    def show
        @wish_list_cars = WishListCar.find(params[:id])
    end
    
    def new
        @wish_list_cars = WishListCar.new
    end
    
    def create
        @wish_list_cars = WishListCar.new(wish_list_cars_params)
        if @wish_list_cars.valid?
            @wish_list_cars.save
            redirect_to @wish_list_cars
        else
            render :new
        end
    end
    
    private
    
    def wish_list_cars_params
        params.require(:wish_list_cars).permit(:user_id, :owned_car_id, :wish_list_cars_time)
    end
    
end
