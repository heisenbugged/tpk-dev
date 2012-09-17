class CreateProblemCategoryRequestJoinTable < ActiveRecord::Migration
  def change
    create_table :problem_categories_problem_requests, :id => false do |t|
      t.integer :problem_category_id
      t.integer :problem_request_id
    end
    add_index :problem_categories_problem_requests, :problem_category_id
    add_index :problem_categories_problem_requests, :problem_request_id
  end
end
