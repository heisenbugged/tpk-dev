class ProblemDetail < ActiveRecord::Base
  attr_accessible :name, :problem_category_id, :skill_ids

  belongs_to :problem_category
  has_and_belongs_to_many :skills
  
  accepts_nested_attributes_for :skills
  
end
