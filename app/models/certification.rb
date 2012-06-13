class Certification < ActiveRecord::Base
  attr_accessible :cert_name

  has_many :skills
end
