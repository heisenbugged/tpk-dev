class HomeController < ApplicationController
  def index
    @categories = ProblemCategory.all
  end
  
  def mission_statement
    @page_title = "Mission Statement"
  end  
end
