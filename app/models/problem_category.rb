class ProblemCategory < ActiveRecord::Base
  attr_accessible :category_name, :css_class
  
  def name
    category_name
  end

  has_many :problem_details
end
