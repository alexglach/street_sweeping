class SessionsController < ApplicationController

  def new
    if signed_in_user?
      redirect_to root_path
    end
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "You have successfully signed in"
      redirect_to request.referrer
    else
      flash[:danger] = "Incorrect log-in information. Please try again"
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "You've successfully signed out"
    redirect_to root_path
  end
end
