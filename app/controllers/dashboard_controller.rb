class DashboardController < ApplicationController  
  def index
    authorize! :read, :dashboard
    @affiliate = current_user.affiliate
  end
end
