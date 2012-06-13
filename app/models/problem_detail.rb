class ProblemDetail < ActiveRecord::Base
  attr_accessible :name

  has_one :problem_category
  has_many :skills
end
