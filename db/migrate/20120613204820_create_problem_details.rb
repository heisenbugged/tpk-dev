class CreateProblemDetails < ActiveRecord::Migration
  def change
    create_table :problem_details do |t|
      t.string :name
      t.references :problem_category      
      t.timestamps
    end
    add_index :problem_details, :problem_category_id
  end
end
