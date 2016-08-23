class SearchesController < ApplicationController  

  def index
    @streets = street_names
    @street = params[:street] || nil
    if @street
      if street_names.include?(@street)
        @results = client.get("wisd-cxpy", {:street => "#{@street}"})
      else
        flash[:danger] = "Please choose a street that exists and stop messing with inspect tools"
      end
    end
        
  end


end

