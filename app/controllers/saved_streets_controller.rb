class SavedStreetsController < ApplicationController

  def create
    @saved_street = current_user.saved_streets.build
    @saved_street.street_id = params[:street_id]
    if @saved_street.save
      flash.now[:success] = "Street saved"
      redirect_to request.referrer
    else
      flash.now[:danger] = "Could not save street"
      render root_path
    end
  end


  def destroy
    @saved_street = SavedStreet.find(params[:id])
    if @saved_street.destroy && @saved_street.user_id == current_user.id
      flash[:success] = "Street removed from your account"
      redirect_to request.referrer
    else
      flash[:danger] = "Could not remove street from your account"
      redirect_to request.referrer
    end

  end

  

  private 

end
