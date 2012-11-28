class ProblemRequest < ActiveRecord::Base
  attr_accessible :description, :category_ids, :detail_ids,
                  :full_name, :email, :phone, :zip,
                  :address, :address_attributes, :others
  
  
  has_and_belongs_to_many :categories, :class_name => "ProblemCategory"
  has_and_belongs_to_many :details, :class_name => "ProblemDetail"

  with_options :if => lambda { |o| o.current_step == "form" } do |o|
    o.validate :has_detail?
  end
    
  with_options :if => lambda { |o| o.current_step == "category" } do |o|
    o.validates_presence_of :category_ids
  end
  
  with_options :if => lambda { |o| o.current_step == "info" } do |o|
    o.validates_presence_of :full_name, :zip
    o.validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  end
  
  geocoded_by :zip
  after_validation :geocode, :if => :zip_changed?
  
  def other_for_category(category)
    details.find { |d| d.name == "#{d.category.category_name} -- Other" } || category.problem_details.build
  end
  
  # Virtual attribute for creating "Other" problem details to be reviewed from a problem request.
  def others= arr
    # Reject all empty other models
    arr.reject! {|other| other[:name].blank? && other[:description].blank? }
    
    # Associate to problem request.
    arr.each do |other|
      detail = ProblemDetail.new other
      detail.name = "#{detail.category.category_name} -- Other"
      # Other problem details need to be approved by administrators before they are used.
      detail.approved = false
      details << detail
    end
  end
  
  def skill_ids
    Skill.joins(:problem_details).where("problem_details_skills.problem_detail_id in (?)", detail_ids).select("skills.id").map(&:id)
  end
  
  # Retrieve compilation of all skills from problem details
  def skills
    Skill.joins(:problem_details).where("problem_details_skills.problem_detail_id in (?)", detail_ids)
  end
  
  def coordinates
    [latitude, longitude]
  end
    
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
  
private
  def has_detail?
    errors[:base] << "Please specify at least one problem detail to continue." if detail_ids.blank?
  end
end
