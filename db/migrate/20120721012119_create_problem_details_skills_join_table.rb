class CreateProblemDetailsSkillsJoinTable < ActiveRecord::Migration
  create_table :problem_details_skills, :id => false do |t|
    t.integer :problem_detail_id
    t.integer :skill_id
  end
  add_index :problem_details_skills, :problem_detail_id
  add_index :problem_details_skills, :skill_id
end
