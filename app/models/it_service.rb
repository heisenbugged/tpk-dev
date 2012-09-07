class ItService < ActiveRecord::Base
  attr_accessible :name
  
  has_many :service_sets
  has_many :affiliates, :through => :service_sets
  has_and_belongs_to_many :skills
end
