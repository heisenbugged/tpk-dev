class Review < ActiveRecord::Base
  attr_accessible :comments, :date, :rating

  has_one :reviewer
  has_one :affiliate
end
