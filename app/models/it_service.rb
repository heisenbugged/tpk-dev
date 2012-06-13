class ItService < ActiveRecord::Base
  attr_accessible :service_name

  has_many :skills
end
