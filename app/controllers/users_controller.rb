class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_current_user, only: [:edit, :update, :destroy]

  def index

  end

  def new
    @user = User.new
   
  end

  def create
    @user = User.new(user_params)
    if @user.save
      User.welcome_email(@user.id)
      sign_in(@user)
      flash[:success] = "Your account has been created"
      redirect_to root_path
    else
      flash.now[:danger] = "Account could not be created"
      render :new
    end
  end

  def show
    @saved_streets = current_user.get_saved_streets(client)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = "Your profile has been updated"
      redirect_to user_path(current_user)
    else
      flash.now[:danger] = "Your profile could not be updated"
      render :edit
    end
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end


end
