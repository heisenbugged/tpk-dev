class Affiliate < ActiveRecord::Base
  has_many :addresses, :as => :addressable, :dependent => :destroy
  has_many :phones, :as => :phoneable, :dependent => :destroy  
  
  has_many :certifications
  has_many :certificates, :through => :certifications
  
  has_many :skill_sets
  has_many :skills, :through => :skill_sets
  
  has_many :service_sets
  has_many :it_services, :through => :service_sets
  
  
  accepts_nested_attributes_for :certifications
  accepts_nested_attributes_for :service_sets
  accepts_nested_attributes_for :skill_sets
  accepts_nested_attributes_for :phones, :reject_if => lambda { |p| !Phone.new(p).valid? }
  accepts_nested_attributes_for :addresses, :reject_if => lambda { |a| !Address.new(a).valid? }
  
  attr_accessible :company_name, :first_name, :last_name, :bonded, :certifications, :service_sets, :skill_sets
  
  attr_accessible :certifications_attributes, :service_sets_attributes, :skill_sets_attributes, 
                  :addresses_attributes, :phones_attributes
                                    
  validates_presence_of :company_name, :phones
  validate :has_skill?, :on => :create
  validate :has_address?, :on => :create
  
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
    Skill.find(all_skill_ids)
  end
  
  def all_skill_ids
    [skill_ids, certificate_skill_ids, service_skill_ids].flatten.uniq
  end
  
  def certificate_skill_ids
    Skill.joins(:certificates => :certifications).where(:certifications => {:affiliate_id => self.id}).select("skills.id").map(&:id)
  end
  
  def service_skill_ids
    Skill.joins(:it_services => :service_sets).where(:service_sets => {:affiliate_id => self.id}).select("skills.id").map(&:id)
  end  
  
  
private
  def has_address?
    errors[:base] << "You must enter an address with a street, city, state, and zip code." if self.addresses.blank?
  end
    
  # Validate the affiliate has at least one cert, service or skill.
  def has_skill?
    if self.certifications.blank? && self.skill_sets.blank? && self.service_sets.blank?
      errors[:base] << "You must enter at least one It Service, Certification or Skill."
    end
  end
end