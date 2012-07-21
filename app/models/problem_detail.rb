class ProblemDetail < ActiveRecord::Base
  attr_accessible :name, :problem_category_id

  belongs_to :problem_category
  has_and_belongs_to_many :skills
end
