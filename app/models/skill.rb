class Skill < ActiveRecord::Base
  attr_accessible :description, :name, :problem_detail_id

  has_many :affiliates, :through => :skill_sets
  has_and_belongs_to_many :problem_details
end
