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

    def edit
        @booking = Booking.find(params[:id])
    end

    def update
        @booking = Booking.find_by(id: params[:id]) #this is an object
        @booking.update(booking_params)
        redirect_to @booking
    end

    def destroy
        @booking = Booking.find_by(id: params[:id])
        @booking.destroy
        redirect_to @booking
    end


    private

    def booking_params
        params.require(:booking).permit(:user_id, :owned_car_id, :booking_time)
    end

end
