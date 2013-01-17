class Address < ActiveRecord::Base
  scope :of_affiliates, where(:addressable_type => "Affiliate").includes(:addressable)
  
  attr_accessible :city, :state, :street_line_1, :street_line_2, :zip
  belongs_to :addressable, :polymorphic => true
  geocoded_by :full_address  
  
  validates_presence_of :street_line_1, :city, :state, :if => lambda { |o| o.addressable_type != "ProblemRequest" }
  validates_presence_of :zip, :if => lambda { |o| o.addressable_type == "ProblemRequest" }
  after_validation :geocode, :if => lambda { |obj| obj.changed? }
  
  def full_address
    "#{street_line_1}, #{city}, #{state}, #{zip}"
  end  
  
end