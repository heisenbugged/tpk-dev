class Address < ActiveRecord::Base
  attr_accessible :city, :state, :street_line_1, :street_line_2, :zip
  belongs_to :addressable, :polymorphic => true  
  validates_presence_of :street_line_1, :city, :state, :zip
  
  geocoded_by :full_address  
  after_validation :geocode, :if => lambda { |obj| obj.changed? }
  
  def full_address
    "#{street_line_1}, #{city}, #{state}, #{zip}"
  end  
  
end