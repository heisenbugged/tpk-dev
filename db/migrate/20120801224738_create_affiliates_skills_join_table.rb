class CreateAffiliatesSkillsJoinTable < ActiveRecord::Migration
  def change
    create_table :affiliates_skills, :id => false do |t|
      t.integer :affiliate_id
      t.integer :skill_id
    end    
  end
end
