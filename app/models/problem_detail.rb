class ProblemDetail < ActiveRecord::Base  
  attr_accessible :name, :description, :problem_category_id, :skill_ids
  attr_accessible :approved, :as => :admin

  belongs_to :problem_category
  has_and_belongs_to_many :skills
  
  accepts_nested_attributes_for :skills
  
  scope :approved, where(:approved => true)
  
  # Simple alias for problem category.
  def category; problem_category; end
end
