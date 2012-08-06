class Phone < ActiveRecord::Base
  attr_accessible :number, :ph_type
  belongs_to :phoneable, :polymorphic => true
  validates_presence_of :number, :ph_type
end
