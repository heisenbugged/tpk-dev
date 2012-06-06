class Phone < ActiveRecord::Base
  attr_protected :number, :ph_type

  belongs_to :phoneable, :polymorphic => true
end
