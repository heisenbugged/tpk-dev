class Affiliate < ActiveRecord::Base
  has_many :addresses, :as => :addressable, :dependent => :destroy
  has_many :phones, :as => :phoneable, :dependent => :destroy
  has_and_belongs_to_many :it_services
  has_and_belongs_to_many :certifications
  has_and_belongs_to_many :skills
  
  accepts_nested_attributes_for :certifications, :reject_if => lambda { |a| a[:cert_name].blank? }
  accepts_nested_attributes_for :it_services,    :reject_if => lambda { |a| a[:service_name].blank? }
  accepts_nested_attributes_for :skills,         :reject_if => lambda { |a| a[:name].blank? }  
  accepts_nested_attributes_for :phones,         :reject_if => lambda { |p| p[:number].blank? or p[:ph_type].blank? }
  accepts_nested_attributes_for :addresses
  
  attr_accessible :company_name, :first_name, :last_name, :bonded, :certifications, :it_services
  
  attr_accessible :certifications_attributes, :it_services_attributes, :skills_attributes, 
                  :addresses_attributes, :phones_attributes
                                    
  validates_presence_of :company_name, :addresses, :phones
  validate :must_have_skill, :on => :create
  
  
private
  # Validate the affiliate has at least one cert, service or skill.
  def must_have_skill
    if self.it_services.blank? and self.certifications.blank? and self.skills.blank?
      errors[:base] << "You must enter at least one It Service, Certification or Skill."      
    end
  end
end