class Certificate < ActiveRecord::Base
  attr_accessible :name
   
  has_many :certifications
  has_many :affiliates, :through => :certifications
  has_and_belongs_to_many :skills
end
