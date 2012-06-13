class Customer < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  has_many :addresses
  has_many :phones
end
