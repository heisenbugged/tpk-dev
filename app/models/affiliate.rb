class Affiliate < ActiveRecord::Base
  attr_accessible :company_name, :bonded

  has_many :addresses, :as => :addressable
  has_many :phones, :as => :phoneable
  has_many :it_services
  has_many :certifications
end