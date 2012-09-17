class CreateCertificatesSkillsJoinTable < ActiveRecord::Migration
  def change
    create_table :certificates_skills, :id => false do |t|
      t.integer :certificate_id
      t.integer :skill_id
    end
    add_index :certificates_skills, :certificate_id
    add_index :certificates_skills, :skill_id
  end
end
