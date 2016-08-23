class SessionsController < ApplicationController

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "You have successfully signed in"
      redirect_to user_path(current_user)
    else
      flash[:danger] = "Incorrect log-in information. Please try again"
      redirect_to root_path
    end
  end

  def destroy
    sign_out
    flash[:success] = "You've successfully signed out"
    redirect_to root_path
  end
end
