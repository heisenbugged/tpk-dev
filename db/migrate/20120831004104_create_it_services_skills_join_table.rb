class CreateItServicesSkillsJoinTable < ActiveRecord::Migration
  def change
    create_table :it_services_skills, :id => false do |t|
      t.integer :it_service_id
      t.integer :skill_id
    end
    add_index :it_services_skills, :it_service_id
    add_index :it_services_skills, :skill_id
  end
end
