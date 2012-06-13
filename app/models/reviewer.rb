class Reviewer < ActiveRecord::Base
  attr_accessible :email_address, :name, :verified
end
