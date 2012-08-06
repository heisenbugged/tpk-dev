class ItService < ActiveRecord::Base
  attr_accessible :service_name
  
  has_and_belongs_to_many :affiliates
  has_many :skills
end
