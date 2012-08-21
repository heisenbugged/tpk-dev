class CreateSkillSets < ActiveRecord::Migration
  def change
    create_table :skill_sets do |t|
      t.integer :affiliate_id
      t.integer :skill_id
    end
  end
end
