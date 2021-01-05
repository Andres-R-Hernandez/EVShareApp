class SessionsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/"
      #if authentication is valid, redirect to the welcome page (until the user home page is built)
    else
      flash[:errors] = ['Email or password is incorrect']
      redirect_to "/login"
    end
  end

  def destroy
    session.delete :user_id
    redirect_to "/login"
  end
end
