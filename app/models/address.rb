class Address < ActiveRecord::Base
  attr_accessible :city, :state, :street_line_1, :street_line_2, :zip

  belongs_to :addressable, :polymorphic => true
end