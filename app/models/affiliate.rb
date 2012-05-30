class Affiliate < ActiveRecord::Base
  attr_accessible :company_name

  has_many :addresses, :as => :addressable
end