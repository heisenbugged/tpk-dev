class ProblemCategory < ActiveRecord::Base
  default_scope order('category_name asc')
  
  attr_accessible :category_name, :css_class
  
  def name
    category_name
  end

  has_and_belongs_to_many :problem_requests
  has_many :problem_details
end
