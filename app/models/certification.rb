class Certification < ActiveRecord::Base
  attr_accessible :cert_name
    
  has_and_belongs_to_many :affiliates
  has_many :skills
end
