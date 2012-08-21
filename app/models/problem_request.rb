class ProblemRequest < ActiveRecord::Base
  attr_accessible :description, :category_ids, :detail_ids,
                  :full_name, :email, :phone, :zip,
                  :address, :address_attributes
  
  
  has_and_belongs_to_many :categories, :class_name => "ProblemCategory"
  has_and_belongs_to_many :details, :class_name => "ProblemDetail"
  
  with_options :if => lambda { |o| o.current_step == "category" } do |o|
    o.validates_presence_of :category_ids
  end
  
  with_options :if => lambda { |o| o.current_step == "info" } do |o|
    o.validates_presence_of :full_name, :zip
    o.validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  end
  
  geocoded_by :zip
  after_validation :geocode, :if => :zip_changed?
    
  # == functions for multi-step form support.
  #    state machine would be a decent alternative.
  def current_step
    @current_step || steps.first
  end
  
  def current_step= step
    @current_step = step
  end
  
  def steps
    %w[category form info]
  end
  
  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end
  
  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end  
  
  def first_step?
    current_step == steps.first
  end

   def last_step?
    current_step == steps.last
  end
  #== end functions for multi-step form support.
end
