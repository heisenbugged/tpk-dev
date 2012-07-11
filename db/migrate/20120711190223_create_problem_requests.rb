class CreateProblemRequests < ActiveRecord::Migration
  def change
    create_table :problem_requests do |t|

      t.timestamps
    end
  end
end
