class SkillSet < ActiveRecord::Base
  attr_accessible :skill_id, :affiliate_id, :skill_name, :_destroy
  attr_accessor :_destroy
  
  belongs_to :affiliate
  belongs_to :skill
  
  before_save :save_skill
  
  def skill_name
    (skill && skill.name) || @skill_name
  end
  
  def skill_name=(name)
    return if name.blank?
    skill = Skill.find_by_name(name)
    if skill
      self.skill = skill
    else    
      @skill = Skill.new(:name => name)
      self.skill = @skill
    end
    @skill_name = name
  end
    
  def save_skill    
    @skill.save if @skill
  end
end
