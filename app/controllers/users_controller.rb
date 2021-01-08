class UsersController < ApplicationController

  def index
    return head(:forbidden) unless is_admin?
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    return head(:forbidden) unless has_access(@user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
        session[:user_id] = @user.id
        redirect_to @user
    else
        render :new
    end
  end

  def edit
    return head(:forbidden) unless has_access(params[:id].to_i)
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    if @user.save
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    return head(:forbidden) unless has_access(params[:id].to_i)
    User.find(params[:id]).destroy
    redirect_to "/"
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :driver_id, :address, :email, :password, :password_confirmation)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
