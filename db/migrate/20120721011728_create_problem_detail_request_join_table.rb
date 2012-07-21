class CreateProblemDetailRequestJoinTable < ActiveRecord::Migration
  def change
    create_table :problem_details_problem_requests, :id => false do |t|
      t.integer :problem_detail_id
      t.integer :problem_request_id
    end
  end
end
