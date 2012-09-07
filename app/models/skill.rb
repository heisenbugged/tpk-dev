class Skill < ActiveRecord::Base
  attr_accessible :description, :name, :problem_detail_id
  
  has_many :skill_sets
  has_and_belongs_to_many :problem_details  
  has_and_belongs_to_many :certificates
  has_and_belongs_to_many :it_services
end
