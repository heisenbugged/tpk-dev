class ItServicesController < ApplicationController
  def index
    @services = ItService.order(:name).where("name like ?", "%#{params[:term]}%").limit(10)
    render :json => @services.map(&:name)
  end
end
