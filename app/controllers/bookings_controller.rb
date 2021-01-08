class BookingsController < ApplicationController

  def index
    return head(:forbidden) unless is_admin?
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    return head(:forbidden) unless has_access(@booking.user_id)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
        redirect_to current_user
    else
        render :new
    end
  end

  def edit
    return head(:forbidden) unless has_access(params[:id].to_i)
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find_by(id: params[:id]) #this is an object
    @booking.update(booking_params)

    if @booking.save
        redirect_to @booking
    else
        render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    return head(:forbidden) unless has_access(@booking.user_id)
    @booking.destroy
    redirect_to current_user
  end


  private

  def booking_params
    params.require(:booking).permit(:user_id, :owned_car_id, :pickup_time, :dropoff_time)
  end

end
