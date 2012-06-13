class Referral < ActiveRecord::Base
  attr_accessible :date_referred, :time_referred

  has_one :customer
  has_many :affiliates
  has_many :problem_details
end
