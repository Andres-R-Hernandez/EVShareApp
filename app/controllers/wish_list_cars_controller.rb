class WishListCarsController < ApplicationController

  def index
    return head(:forbidden) unless is_admin?
    @wish_list_cars = WishListCar.all
  end

  def show
    return head(:forbidden) unless is_admin?
    @wish_list_car = WishListCar.find(params[:id])
  end

  def new
    @wish_list_car = WishListCar.new
  end

  def create
    @wish_list_car = WishListCar.new(wish_list_car_params)
    if @wish_list_car.valid?
        @wish_list_car.save
        redirect_to current_user
    else
        render :new
    end
  end

  def edit
    @wish_list_car = WishListCar.find(params[:id])
    return head(:forbidden) unless has_access(@wish_list_car.user_id)
  end

  def update
    @wish_list_car = WishListCar.find_by(id: params[:id])
    @wish_list_car.update(wish_list_car_params)
    redirect_to @wish_list_car
  end

  def destroy
    @wish_list_car = WishListCar.find_by(id: params[:id])
    return head(:forbidden) unless has_access(@wish_list_car.user_id)
    @wish_list_car.destroy
    redirect_to @wish_list_car
  end


  private

  def wish_list_car_params
    params.require(:wish_list_car).permit(:car_model_id, :user_id)
  end

end
