class Affiliate < ActiveRecord::Base
  STATES = [:active, :suspended, :pending, :on_hold]
  
  has_many :addresses, :as => :addressable, :dependent => :destroy
  has_many :phones, :as => :phoneable, :dependent => :destroy  
  
  has_many :certifications, :dependent => :nullify
  has_many :certificates, :through => :certifications
  has_many :certificates_skills, :through => :certificates, :source => :skills
  
  has_many :skill_sets, :dependent => :nullify
  has_many :skills, :through => :skill_sets
  
  has_many :service_sets, :dependent => :nullify
  has_many :it_services, :through => :service_sets
  has_many :it_services_skills, :through => :it_services, :source => :skills
  
  has_one :user
  has_one :week_availability
  
  accepts_nested_attributes_for :certifications, :allow_destroy => true, :reject_if => lambda { |c| Certification.new(c).cert_name.blank? }
  accepts_nested_attributes_for :service_sets,   :allow_destroy => true, :reject_if => lambda { |s| ServiceSet.new(s).service_name.blank? }
  accepts_nested_attributes_for :skill_sets,     :allow_destroy => true, :reject_if => lambda { |s| SkillSet.new(s).skill_name.blank? }
  accepts_nested_attributes_for :phones,         :allow_destroy => true, :reject_if => lambda { |p| !Phone.new(p).valid? }
  accepts_nested_attributes_for :addresses,      :allow_destroy => true, :reject_if => lambda { |a| !Address.new(a).valid? }
    
  attr_accessible :company_name, :first_name, :last_name, :bonded, :certifications, :service_sets, :skill_sets,
                  :website_url, :bonded, :email, :logo, :logo_cache
  
  # State of current affiliate, based on a suspension the users create
  # or an administrator creates. Any suspensions issued by an administrator
  # take precedence over user states.
  #   
  #   active (default) - means everything is fine and affiliate is active in the system.
  #   suspended        - means we've suspended them for some reason.
  #   pending          - means something prevents us from making them live such as missing information
  #   on_hold          - not suspended, but just on hold (e.g., on vacation)
  attr_accessible :state
  
  attr_accessible :certifications_attributes, :service_sets_attributes, :skill_sets_attributes, 
                  :addresses_attributes, :phones_attributes
                  
  mount_uploader :logo, LogoUploader
  
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :if => lambda { !email.blank? }
  validates_presence_of :company_name, :addresses, :first_name, :last_name, :email
  validate :has_skill?, :on => :create
  validate :has_phone_or_email?, :on => :create
  
  # Must create
  before_save :add_week_availability
  
  # Accepts and validates affiliate for use in system.
  # Creates User account to manage the newly accepted affiliate account.
  def accept    
    # Create user with completely random password, which will then be updated
    # by the user when he receives his email.
    pwd = (0...25).map{ ('a'..'z').to_a[rand(26)] }.join
    
    transaction do
      self.state = "active"
      self.user = User.find_or_initialize_by_email(:email => self.email, :password => pwd)
      self.save
    end
    true
    
  # Return false if transaction fails
  rescue ActiveRecord::RecordInvalid => invalid
    false
  end
  
  # Finds overlap between all the skills for this affiliate
  # and all the skills for the problem request passed in.
  def skills_for_problem problem_request
    Skill.find(all_skill_ids & problem_request.skill_ids)
  end
  
  # Scoring algorithm for determining sort order of affiliates for a problem request.
  def score problem_request
    (all_skill_ids & problem_request.skill_ids).count
  end
  
  def all_skills
    [skills, certificates_skills, it_services_skills].flatten.uniq
  end
  
  def all_skill_ids
    [skill_ids, certificate_skill_ids, service_skill_ids].flatten.uniq
  end
  
  def certificate_skill_ids
    certificates_skills.select("skills.id").map(&:id)
  end
  
  def service_skill_ids
    it_services_skills.select("skills.id").map(&:id)
  end  
  
  
private
  # Creates stub week availability model if one doesn't exist already.
  def add_week_availability
    return if self.week_availability
    self.week_availability = WeekAvailability.create
  end
  
  def has_phone_or_email?
    if email.blank? && phones.any? {|p| p.ph_type == "Mobile" || p.ph_type == "Landline" }
      errors[:base] << "You must enter at least one phone number or an email address"
    end
  end
    
  # Validate the affiliate has at least one cert, service or skill.
  def has_skill?
    if self.certifications.blank? && self.skill_sets.blank? && self.service_sets.blank?
      errors[:base] << "You must enter at least one It Service, Certification or Skill."
    end
  end
end