class WeekAvailabilitiesController < ApplicationController
  
  def update
    WeekAvailability.find(params[:id]).update_day(params[:day])
    
    respond_to do |format|
      format.json { head :ok }
    end    
  end
  
end
