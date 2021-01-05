class BookingsController < ApplicationController

    def index
        @bookings = Booking.all 
    end 

    def show
        @booking = Booking.find(params[:id])
    end 

    def new 
        @booking = Booking.new 
    end 

    def create 
        @booking = Booking.new(booking_params)
        if @booking.valid?
            @booking.save 
            redirect_to @booking
        else 
            render :new 
        end 
    end 

    private
     
    def booking_params
        params.require(:booking).permit(:user_id, :owned_car, :booking_time)
    end 

end
