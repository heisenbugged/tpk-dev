class AddAddressToProblemRequest < ActiveRecord::Migration
  def change
    add_column :problem_requests, :address_id, :integer    
    ProblemRequest.where("problem_requests.zip IS NOT NULL").each { |p| p.build_address(zip: p.zip); p.save }
  end
end
