class OwnedCarsController < ApplicationController

    def index
      return head(:forbidden) unless is_admin?
      @owned_cars = OwnedCar.all
    end

    def show
      @owned_car = OwnedCar.find(params[:id])
      @booking = Booking.new
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

    def edit
      @owned_car = OwnedCar.find(params[:id])
      return head(:forbidden) unless has_access(@owned_car.user_id)
    end

    def update
      @owned_car = OwnedCar.find(params[:id])
      @owned_car.update(owned_car_params)

      if @owned_car.save
        redirect_to @owned_car
      else
        render :edit
      end
    end

    def destroy
      @owned_car = OwnedCar.find(params[:id])
      return head(:forbidden) unless has_access(@owned_car.user_id)
      @owned_car.destroy
      redirect_to "/"#session[:user_id]
    end

    private

    def owned_car_params
        params.require(:owned_car).permit(:year, :price_per_day, :city, :car_model_id, :user_id, :color)
    end
end
