class HomeController < ApplicationController
  def index
    @categories = ProblemCategory.all
  end
  
  def second
  end
end
